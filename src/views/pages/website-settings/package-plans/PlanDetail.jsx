'use client'
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';
import Button from '@mui/material/Button';
import OpenDialogOnElementClick from '@components/dialogs/OpenDialogOnElementClick';
import CustomAvatar from '@core/components/mui/Avatar';
import { useParams } from 'next/navigation';;
import { useCallback, useEffect, useState } from 'react';
import Loader from '@/components/loader';
import apiClient from '@/utils/apiClient';
import EditPackagePlan from '@/components/dialogs/edit-package-plan';

const PlanDetail = () => {
    const [planData, setPlanData] = useState({});
    const [isLoading, setIsLoading] = useState(false);
    const { id } = useParams();
    const defaultImg = "/images/default-images/pricing-basic.png"

    const getPlanDetail = useCallback(async () => {
        setIsLoading(true);
        const response = await apiClient.post('/api/package-plans/get-by-id', { id });
        if (response.data.result === true) {
            setPlanData(response.data.message);
            setIsLoading(false);
        }
    }, []);

    useEffect(() => {
        getPlanDetail();
    }, []);

    const buttonProps = (children, color, variant) => ({
        children,
        color,
        variant
    });

    const handlePackageUpdate = (updatedFields) => {
        setPlanData(updatedFields)
    };

    return (
        <Card>
            {isLoading && (<div className='my-4'>
                <Loader size='lg' />
            </div>)}
            {!isLoading && (<CardContent className='flex flex-col pbs-12 gap-6'>
                <div className='flex flex-col gap-6'>
                    <div className='flex items-center justify-center flex-col gap-4'>
                        <div className='flex flex-col items-center gap-4'>
                            <CustomAvatar alt='plan-image' src={planData.image || defaultImg} variant='rounded' size={100} />
                            <Typography variant='h5'>{`${planData.postedBy || ''}`}</Typography>
                        </div>
                    </div>
                </div>
                <div>
                    <Typography variant='h5'>Details</Typography>
                    <Divider className='mlb-4' />
                    <div className='flex flex-col gap-2'>
                        <div className='flex items-center flex-wrap gap-x-1.5'>
                            <Typography variant='h6'>Title:</Typography>
                            <Typography>{planData.title}</Typography>
                        </div>
                        <div className='flex items-center flex-wrap gap-x-1.5'>
                            <Typography variant='h6'>Sub Title:</Typography>
                            <Typography>{planData.subTitle}</Typography>
                        </div>
                        <div className='flex items-center flex-wrap gap-x-1.5'>
                            <Typography variant='h6'>Monthly Price:</Typography>
                            <Typography>₹ {planData.monthlyPrice}</Typography>
                        </div>
                        <div className='flex items-center flex-wrap gap-x-1.5'>
                            <Typography variant='h6'>Yearly Price:</Typography>
                            <Typography>₹ {planData?.yearlyPlan?.monthly}/month - ₹ {planData?.yearlyPlan?.annually}/year</Typography>
                        </div>
                        <Typography variant='h6'>Features:</Typography>
                        {planData?.planBenefits?.map((item) => (
                            <div className='flex items-center flex-wrap gap-x-1.5 ml-5' key={item.feature}>
                                <span>•</span><Typography>{item.feature}</Typography>
                            </div>
                        ))}

                    </div>
                </div>
                <div className='flex gap-4 justify-center'>
                    <OpenDialogOnElementClick
                        element={Button}
                        elementProps={buttonProps('Edit', 'primary', 'contained')}
                        dialog={EditPackagePlan}
                        dialogProps={{ data: planData, id: id, handlePackageUpdate }}
                    />
                </div>
            </CardContent>)}
        </Card>
    )
}

export default PlanDetail
