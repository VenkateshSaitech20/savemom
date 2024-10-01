'use client'

// React Imports
import { useEffect, useState } from 'react'

// MUI Imports
import Grid from '@mui/material/Grid'
import Tab from '@mui/material/Tab'
import TabContext from '@mui/lab/TabContext'
import TabPanel from '@mui/lab/TabPanel'

// Component Imports
import UserProfileHeader from './UserProfileHeader'
import CustomTabList from '@core/components/mui/TabList'
import apiClient from '@/utils/apiClient'

const UserProfile = ({ tabContentList, data }) => {
    // States
    const [activeTab, setActiveTab] = useState('profile')
    const [userProfile, setUserProfile] = useState()

    const handleChange = (event, value) => {
        setActiveTab(value)
    }

    const getUserProfile = async () => {
        const response = await apiClient.get(`/api/profile`);
        if (response.data.result === true) {
            if (response.data.message) {
                const data = response.data.message;
                setUserProfile(data);
            }
        }
    };
    useEffect(() => {
        getUserProfile();
    }, []);

    return (
        <Grid container spacing={6}>
            <Grid item xs={12}>
                <UserProfileHeader data={userProfile ? userProfile : ''} />
            </Grid>
            {activeTab === undefined ? null : (
                <Grid item xs={12} className='flex flex-col gap-6'>
                    <TabContext value={activeTab}>
                        <CustomTabList onChange={handleChange} variant='scrollable' pill='true'>
                            <Tab label='Profile' icon={<i className='bx-user' />} iconPosition='start' value='profile' />
                            {/* <Tab label='Teams' icon={<i className='bx-group' />} iconPosition='start' value='teams' />
              <Tab label='Projects' icon={<i className='bx-grid-alt' />} iconPosition='start' value='projects' />
              <Tab label='Connections' icon={<i className='bx-link' />} iconPosition='start' value='connections' /> */}
                        </CustomTabList>

                        <TabPanel value={activeTab} className='p-0'>
                            {tabContentList[activeTab]}
                        </TabPanel>
                    </TabContext>
                </Grid>
            )}
        </Grid>
    )
}

export default UserProfile
