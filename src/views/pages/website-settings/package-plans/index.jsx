'use client'
import Grid from '@mui/material/Grid';
import PlanTable from './PlanTable';
import SubUserPermission from '@/utils/SubUserPermission';

const Plan = () => {

    const { websiteSettingsPermission } = SubUserPermission();

    return (
        <Grid container spacing={6}>
            <Grid item xs={12}>
                <PlanTable websiteSettingsPermission={websiteSettingsPermission} />
            </Grid>
        </Grid>
    )
}

export default Plan
