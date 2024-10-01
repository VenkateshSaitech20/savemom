"use client";
import Grid from '@mui/material/Grid';
import UserListTable from './UserListTable';
import SubUserPermission from '@/utils/SubUserPermission';

const UserList = () => {
  const { manageUsersPermission } = SubUserPermission();
  return (
    <Grid container spacing={6}>
      {/* <Grid item xs={12}>
        <UserListCards />
      </Grid> */}
      <Grid item xs={12}>
        <UserListTable manageUsersPermission={manageUsersPermission} />
      </Grid>
    </Grid>
  )
}

export default UserList
