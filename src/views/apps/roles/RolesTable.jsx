'use client'
import { useEffect, useState, useMemo, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import Grid from '@mui/material/Grid';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import MenuItem from '@mui/material/MenuItem';
import { styled } from '@mui/material/styles';
import classnames from 'classnames';
import { rankItem } from '@tanstack/match-sorter-utils';
import PropTypes from "prop-types";
import {
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  useReactTable,
  getFilteredRowModel,
  getFacetedRowModel,
  getFacetedUniqueValues,
  getFacetedMinMaxValues,
  getPaginationRowModel,
  getSortedRowModel
} from '@tanstack/react-table';
import TextFieldStyled from '@core/components/mui/TextField';
import TablePaginationComponent from '@components/TablePaginationComponent';
import tableStyles from '@core/styles/table.module.css';
import Loader from '@/components/loader';
import ConfirmationDialog from '@/components/dialogs/confirmation-dialog';
import { pageList, responseData } from '@/utils/message';
import apiClient from '@/utils/apiClient';
import { signOut } from 'next-auth/react';
import OpenDialogOnElementClick from '@components/dialogs/OpenDialogOnElementClick';
import RoleDialog from '@components/dialogs/role-dialog';
import { toast } from 'react-toastify';
import Link from '@components/Link';
const Icon = styled('i')({})
const fuzzyFilter = (row, columnId, value, addMeta) => {
  const itemRank = rankItem(row.getValue(columnId), value)
  addMeta({
    itemRank
  })
  return itemRank.passed
};
const columnHelper = createColumnHelper()
const RolesTable = ({ manageRolesPermission }) => {
  const [rowSelection, setRowSelection] = useState({})
  const [data, setData] = useState([]);
  const [filteredData, setFilteredData] = useState([]);
  const [globalFilter, setGlobalFilter] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [open, setOpen] = useState(false);
  const [idToDelete, setIdToDelete] = useState('');
  const [searchText, setSearchText] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [pageSize, setPageSize] = useState(Number(pageList[0].value));
  const [totalPages, setTotalPages] = useState();
  const typographyProps = {
    children: (
      <IconButton >
        <i className='bx-edit-alt text-textSecondary text-[22px]' />
      </IconButton>
    ),
    component: Link,
    color: 'primary',
    onClick: e => e.preventDefault()
  }
  const getRoles = useCallback(async () => {
    setIsLoading(true);
    const response = await apiClient.post('/api/user-role/get-roles-by-user-id', {
      searchText,
      page: currentPage,
      pageSize
    });
    if (response.data.result === true) {
      setData(response.data.message);
      setFilteredData(response.data.message);
      setTotalPages(response.data.totalPages);
      setIsLoading(false);
    } else if (response.data.result === false) {
      if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
        await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
        sessionStorage.removeItem("token");
      }
    }
  }, [searchText, currentPage, pageSize]);
  useEffect(() => {
    getRoles();
  }, [getRoles]);
  const updateRoles = () => {
    getRoles();
  };
  const handleDelete = async roleId => {
    setIdToDelete(roleId);
    setOpen(true);
  };
  const handleConfirmation = async (confirmed) => {
    if (confirmed) {
      const response = await apiClient.post('/api/user-role/delete', { roleId: idToDelete });
      if (response.data.result === true) {
        updateRoles();
      } else if (response.data.result === false) {
        if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
          await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
          sessionStorage.removeItem("token");
        }
      }
    }
    setIdToDelete(null);
    setOpen(false);
  };
  const columns = useMemo(() => {
    const canDelete = manageRolesPermission?.deletePermission === 'Y';
    const canEdit = manageRolesPermission?.editPermission === 'Y';
    const baseColumns = [
      columnHelper.accessor('roleName', {
        header: 'Role Name',
        cell: ({ row }) => (
          <div className='flex items-center gap-2'>
            <Icon />
            <Typography className='capitalize' color='text.primary'>
              {row.original.roleName}
            </Typography>
          </div>
        )
      })
    ];
    if (canDelete || canEdit) {
      baseColumns.push(
        columnHelper.accessor('action', {
          header: 'Action',
          cell: ({ row }) => (
            <div className='flex items-center'>
              {canEdit && (
                <IconButton onClick={() => handleDelete(row.original.id)}>
                  <i className='bx-trash text-textSecondary text-[22px]' />
                </IconButton>
              )}
              {canEdit && (
                <OpenDialogOnElementClick
                  element={Typography}
                  elementProps={typographyProps}
                  dialog={RoleDialog}
                  dialogProps={{ title: row.original.roleName, updateRoles, showToast, toastMessage: "Role updated successfully" }}
                  roleId={row.original.id}
                />
              )}
            </div>
          ),
          enableSorting: false
        })
      );
    }
    return baseColumns;
  }, [data, filteredData, manageRolesPermission]);
  const table = useReactTable({
    data: filteredData,
    columns,
    pageCount: totalPages,
    manualPagination: true,
    state: {
      rowSelection,
    },
    initialState: {
      pagination: {
        pageSize: pageSize
      }
    },
    onPaginationChange: ({ pageSize, pageIndex }) => {
      setPageSize(pageSize);
      setCurrentPage(pageIndex + 1);
    },
    enableRowSelection: true,
    globalFilterFn: fuzzyFilter,
    onRowSelectionChange: setRowSelection,
    getCoreRowModel: getCoreRowModel(),
    onGlobalFilterChange: setGlobalFilter,
    getFilteredRowModel: getFilteredRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getFacetedRowModel: getFacetedRowModel(),
    getFacetedUniqueValues: getFacetedUniqueValues(),
    getFacetedMinMaxValues: getFacetedMinMaxValues()
  })
  const handleSearchTextChange = (e) => {
    const text = e.target.value;
    setGlobalFilter(e.target.value);
    if (text.length >= 3 || text.length == 0) {
      setSearchText(text)
    }
  };
  const showToast = (success, message) => {
    if (success) {
      toast.success(message, {
        position: "top-center",
        autoClose: 5000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        theme: "dark",
      });
    }
  };
  const CardProps = {
    className: 'cursor-pointer bs-full',
    children: (
      <Grid container className='bs-full'>
        <Grid item xs={12}>
          <div className='flex flex-col sm:flex-row max-sm:is-full items-start sm:items-center gap-4'>
            <Button
              variant='contained'
              startIcon={<i className='bx-plus' />}
              className='max-sm:is-full'
            >
              Add New Role
            </Button>
          </div>
        </Grid>
      </Grid>
    )
  }
  return (
    <>
      <Card>
        <CardHeader title='Filters' className='pbe-4' />
        <div className='flex justify-between flex-col items-start md:flex-row md:items-center p-6 border-bs gap-4'>
          <TextFieldStyled
            select
            value={pageSize}
            onChange={e => {
              setPageSize(Number(e.target.value));
              setCurrentPage(1);
            }}
            className='page-drop-size'
            InputLabelProps={{ shrink: true }}
            variant='filled'
          >
            {pageList?.map(item => (
              <MenuItem key={item.value} value={item.value}>{item.value}</MenuItem>
            ))}
          </TextFieldStyled>
          <div className='flex flex-col sm:flex-row max-sm:is-full items-start sm:items-center gap-4'>
            <TextFieldStyled
              value={globalFilter ?? ''}
              onChange={handleSearchTextChange}
              placeholder='Search Role'
              className='max-sm:is-full min-is-[220px]'
              InputLabelProps={{ shrink: true }}
              variant='filled'
            />
            {manageRolesPermission && manageRolesPermission?.writePermission === "Y" && (
              <OpenDialogOnElementClick
                element={Card}
                elementProps={CardProps}
                dialog={RoleDialog}
                dialogProps={{ updateRoles, showToast, toastMessage: "Role added successfully", manageRolesPermission }}
              />
            )}
          </div>
        </div>
        <div className='overflow-x-auto'>
          <table className={tableStyles.table}>
            <thead>
              {table.getHeaderGroups().map(headerGroup => (
                <tr key={headerGroup.id}>
                  {headerGroup.headers.map(header => (
                    <th key={header.id}>
                      {header.isPlaceholder ? null : (
                        <div
                          className={classnames({
                            'flex items-center': header.column.getIsSorted(),
                            'cursor-pointer select-none': header.column.getCanSort()
                          })}
                          onClick={header.column.getToggleSortingHandler()}
                        >
                          {flexRender(header.column.columnDef.header, header.getContext())}
                          {{
                            asc: <i className='bx-chevron-up text-xl' />,
                            desc: <i className='bx-chevron-down text-xl' />
                          }[header.column.getIsSorted()] ?? null}
                        </div>
                      )}
                    </th>
                  ))}
                </tr>
              ))}
            </thead>
            {table.getFilteredRowModel().rows.length === 0 ? (
              <tbody>
                <tr>
                  <td colSpan={table.getVisibleFlatColumns().length ?? 0} className='text-center'>
                    {isLoading ? <Loader /> : 'No data available'}
                  </td>
                </tr>
              </tbody>
            ) : (
              <tbody>
                {table.getRowModel()
                  .rows.slice(0, pageSize)
                  .map(row => {
                    return (
                      <tr key={row.id} className={classnames({ selected: row.getIsSelected() })}>
                        {row.getVisibleCells().map(cell => (
                          <td key={cell.id}>{flexRender(cell.column.columnDef.cell, cell.getContext())}</td>
                        ))}
                      </tr>
                    )
                  })}
              </tbody>
            )}
          </table>
        </div>
        <TablePaginationComponent
          table={table}
          totalPages={totalPages}
          pageSize={pageSize}
          currentPage={currentPage}
          setCurrentPage={setCurrentPage}
        />
        <ConfirmationDialog open={open} setOpen={setOpen} type='delete-role' onConfirm={handleConfirmation} />
      </Card>
    </>
  )
}
RolesTable.propTypes = {
  manageRolesPermission: PropTypes.any,
}
export default RolesTable
