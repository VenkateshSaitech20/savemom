'use client'
import Grid from '@mui/material/Grid';
import CountryTable from './CountryTable';
import SubUserPermission from '@/utils/SubUserPermission';

const Country = () => {
    const { websiteSettingsPermission } = SubUserPermission();
    return (
        <Grid container spacing={6}>
            <Grid item xs={12}>
                <CountryTable websiteSettingsPermission={websiteSettingsPermission} />
            </Grid>
        </Grid>
    )
}

export default Country
