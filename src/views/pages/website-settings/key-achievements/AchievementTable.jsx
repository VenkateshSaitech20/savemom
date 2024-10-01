'use client'
import { useEffect, useState, useMemo, useCallback } from 'react';
import { useParams, useRouter } from 'next/navigation';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Chip from '@mui/material/Chip';
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
import { getLocalizedUrl } from '@/utils/i18n';
import tableStyles from '@core/styles/table.module.css';
import Loader from '@/components/loader';
import ConfirmationDialog from '@/components/dialogs/confirmation-dialog';
import { pageList, responseData } from '@/utils/message';
import apiClient from '@/utils/apiClient';
import { signOut } from 'next-auth/react';
import AddAchievement from './AddAchievement';
import CustomAvatar from '@/@core/components/mui/Avatar';
import { FormControlLabel, FormGroup, Switch } from '@mui/material';

const Icon = styled('i')({})

const fuzzyFilter = (row, columnId, value, addMeta) => {
    const itemRank = rankItem(row.getValue(columnId), value)
    addMeta({
        itemRank
    })
    return itemRank.passed
};

const columnHelper = createColumnHelper()

const AchievementTable = ({ websiteSettingsPermission }) => {
    const [addAchievementOpen, setAddAchievementOpen] = useState(false)
    const [rowSelection, setRowSelection] = useState({})
    const [data, setData] = useState([]);
    const [filteredData, setFilteredData] = useState([]);
    const [globalFilter, setGlobalFilter] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    const [open, setOpen] = useState(false);
    const [idToDelete, setIdToDelete] = useState('');
    const [searchText, setSearchText] = useState('');
    const router = useRouter();
    const [currentPage, setCurrentPage] = useState(1);
    const [pageSize, setPageSize] = useState(Number(pageList[0].value));
    const [totalPages, setTotalPages] = useState();
    const [checked, setChecked] = useState(true);
    const [apiErrors, setApiErrors] = useState({});
    const [isButtonLoading, setIsButtonLoading] = useState(false);
    const [id, setId] = useState('');


    const handleDelete = async userId => {
        setIdToDelete(userId);
        setOpen(true);
    };

    const getAchievements = useCallback(async () => {
        setIsLoading(true);
        const response = await apiClient.post("/api/website-settings/key-achievement/list", {
            searchText,
            page: currentPage,
            pageSize
        });
        if (response.data.result === true) {
            setData(response.data.message);
            setFilteredData(response.data.message)
            setTotalPages(response.data.totalPages);
            setIsLoading(false);
        } else if (response.data.result === false) {
            if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
                await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
                sessionStorage.removeItem("token");
            }
            setIsLoading(false);
        }
    }, [searchText, currentPage, pageSize]);

    const handleConfirmation = async (confirmed) => {
        setIsLoading(true);
        if (confirmed) {
            const response = await apiClient.put('/api/website-settings/key-achievement/achievement', { id: idToDelete });
            if (response.data.result === true) {
                await getAchievements();
                setOpen(false);
            } else if (response.data.result === false) {
                if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
                    await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
                    sessionStorage.removeItem("token");
                }
            }
        };
        setIsLoading(false);
        setIdToDelete(null);
    };

    const handleViewProfile = (id) => {
        const url = getLocalizedUrl(`/pages/website-settings/key-achievement/${id}`, locale)
        router.push(url);
    };

    useEffect(() => {
        getAchievements()
    }, [getAchievements]);

    const { lang: locale } = useParams()

    const getAvatar = params => {
        const { avatar } = params

        if (avatar) {
            return <CustomAvatar src={avatar} size={34} />
        }
    }

    const columns = useMemo(() => {
        const canDelete = websiteSettingsPermission?.deletePermission === 'Y';
        const canEdit = websiteSettingsPermission?.editPermission === 'Y';

        const baseColumns = [

            columnHelper.accessor('image', {
                header: 'image',
                cell: ({ row }) => (
                    <div className='flex items-center'>
                        {getAvatar({ avatar: row.original.image })}
                    </div>
                ),
            }),
            columnHelper.accessor('keyMetric', {
                header: 'keyMetric',
                cell: ({ row }) => (
                    <div className='flex items-center gap-2'>
                        <Icon />
                        <Typography className='capitalize' color='text.primary'>
                            {row.original.keyMetric}
                        </Typography>
                    </div>
                )
            }),
            columnHelper.accessor('highlight', {
                header: 'Highlight',
                cell: ({ row }) => (
                    <div className='flex items-center gap-3'>
                        <Chip
                            variant='tonal'
                            label={row.original.highlight}
                            size='small'
                            className='capitalize'
                        />
                    </div>
                )
            }),
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
                                <IconButton onClick={() => handleViewProfile(row.original.id)}>
                                    <i className='bx-show text-textSecondary text-[22px]' />
                                </IconButton>
                            )}
                        </div>
                    ),
                    enableSorting: false
                })
            );
        }

        return baseColumns;
    }, [data, filteredData, websiteSettingsPermission]);

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

    const handleAchievementAdded = async () => {
        await getAchievements();
    };

    const handleSearchTextChange = (e) => {
        const text = e.target.value;
        setGlobalFilter(e.target.value);
        if (text.length >= 3 || text.length == 0) {
            setSearchText(text)
        }
    };
    const handleChange = async (event) => {
        setChecked(event.target.checked);
        const togglestatus = event.target.checked ? 'Y' : 'N'
        setApiErrors({});
        setIsButtonLoading(true);
        const postData = {};
        postData.sectionType = 'key_achievements';
        postData.isfrontendvisible = togglestatus
        if (id) { postData.id = id }

        const response = await apiClient.post('/api/website-settings/section-content', postData);
        if (response?.data?.result === true) {

            setApiErrors({});
            getTestimonial('key_achievements');
            setIsButtonLoading(false);
        } else {
            setApiErrors(response.data.message);
            setIsButtonLoading(false);
        }

    };
    const getTestimonial = async (sectionType) => {
        setIsLoading(true);
        const response = await apiClient.get(`/api/website-settings/section-content?sectionType=${sectionType}`);
        if (response.data.result === true) {
            const { id, badgeTitle, title, description } = response.data.message;

            setId(id);
        }
        setIsLoading(false);
    };
    useEffect(() => {
        getTestimonial('key_achievements');
    }, []);
    return (
        <>
            <Card>
                <div className='flex justify-between items-center p-6 border-bs ' >
                    <CardHeader title='Filters' className='mbe-0 p-1' />
                    <FormGroup>
                        <FormControlLabel
                            control={<Switch
                                checked={checked} onChange={handleChange}
                            />}
                            label="show/hide"
                            labelPlacement="start"
                            className='pbe-0'
                            sx={{
                                '& .MuiFormControlLabel-label': {
                                    marginTop: '-4px',
                                }
                            }}
                        />
                    </FormGroup>
                </div>
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
                            placeholder='Search Achievements'
                            className='max-sm:is-full min-is-[220px]'
                            InputLabelProps={{ shrink: true }}
                            variant='filled'
                        />
                        {websiteSettingsPermission && websiteSettingsPermission?.writePermission === "Y" && (
                            <Button
                                variant='contained'
                                startIcon={<i className='bx-plus' />}
                                onClick={() => setAddAchievementOpen(!addAchievementOpen)}
                                className='max-sm:is-full'
                            >
                                Add Achievement
                            </Button>
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
                <ConfirmationDialog open={open} setOpen={setOpen} type='delete-achievement' onConfirm={handleConfirmation} />
            </Card>
            <AddAchievement
                open={addAchievementOpen}
                handleClose={() => setAddAchievementOpen(!addAchievementOpen)}
                handleAchievementAdded={handleAchievementAdded}
            />
        </>
    )
}

AchievementTable.propTypes = {
    websiteSettingsPermission: PropTypes.any,
}

export default AchievementTable