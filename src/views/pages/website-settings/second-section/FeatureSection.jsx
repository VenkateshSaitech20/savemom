'use client'
import { useEffect, useState } from 'react';
import Grid from '@mui/material/Grid';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import TextFieldStyled from '@core/components/mui/TextField';
import { useForm } from 'react-hook-form';
import { registerData, responseData } from '@/utils/message';
import Loader from '@/components/loader';
import apiClient from '@/utils/apiClient';
import { showToast } from '@/utils/helper';
import { signOut } from 'next-auth/react';
import SubUserPermission from '@/utils/SubUserPermission';
import { FormControlLabel, FormGroup, Switch } from '@mui/material';

const FeatureSection = () => {
    const [apiErrors, setApiErrors] = useState({});
    const [id, setId] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [isButtonLoading, setIsButtonLoading] = useState(false);
    const [checked, setChecked] = useState(true);
    const { register, handleSubmit, formState: { errors }, setValue } = useForm();
    const { websiteSettingsPermission } = SubUserPermission();
    const handleSecSubmit = async (data) => {
        setIsButtonLoading(true);
        const isfrontendvisible = checked ? "Y" : "N";
        const postData = { ...data, sectionType: 'feature', isfrontendvisible }
        if (id) postData.id = id;
        const response = await apiClient.post('/api/website-settings/section-content', postData);
        if (response.data.result === true) {
            setIsButtonLoading(true);
            showToast(true, response.data.message);
            getSectionContent('feature');
            setApiErrors({});
            setIsButtonLoading(false);
        } else if (response.data.result === false) {
            if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
                await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
                sessionStorage.removeItem("token");
            } else {
                setApiErrors(response.data.message);
                setIsButtonLoading(true);
            }
        }
    }
    const getSectionContent = async (sectionType) => {
        setIsLoading(true);
        const response = await apiClient.get(`/api/website-settings/section-content?sectionType=${sectionType}`);
        if (response.data.result === true) {
            if (response.data.message) {
                const data = response.data.message;
                Object.keys(data).forEach((key) => {
                    setValue(key, data[key]);
                });
                setChecked(response.data.message.isfrontendvisible === "Y" ? true : false);
                if (data.id) {
                    setId(data.id);
                }
            }
        }
        setIsLoading(false);
    };

    useEffect(() => {
        getSectionContent('feature');
    }, []);

    return (
        <Card>
            {isLoading && <div className='my-4'><Loader /></div>}
            {!isLoading && (
                <CardContent>
                    <form autoComplete='off' onSubmit={handleSubmit(handleSecSubmit)}>
                        <Grid container spacing={6}>
                            <Grid item xs={12} sm={6}>
                                <TextFieldStyled
                                    fullWidth
                                    variant='filled'
                                    size={"small"}
                                    InputLabelProps={{ shrink: true }}
                                    label='Badge Title'
                                    placeholder='Badge Title'
                                    inputProps={{ maxLength: 100 }}
                                    error={!!errors.badgeTitle || apiErrors?.badgeTitle}
                                    helperText={errors?.badgeTitle?.message || apiErrors?.badgeTitle}
                                    {...register('badgeTitle', { required: registerData.badgeTitleReq, validate: value => value.trim() !== '' || registerData.badgeTitleReq })}
                                    onInput={(e) => {
                                        const { value } = e.target;
                                        e.target.value = value.replace(/[^a-zA-Z ]/g, '');
                                    }}
                                />
                            </Grid>
                            <Grid item xs={12} sm={6}>
                                <TextFieldStyled
                                    fullWidth
                                    variant='filled'
                                    size={"small"}
                                    InputLabelProps={{ shrink: true }}
                                    label='Title'
                                    placeholder='Title'
                                    inputProps={{ maxLength: 100 }}
                                    error={!!errors.title || apiErrors?.title}
                                    helperText={errors?.title?.message || apiErrors?.title}
                                    {...register('title', { required: registerData.titleReq, validate: value => value.trim() !== '' || registerData.titleReq })}
                                    onInput={(e) => {
                                        const { value } = e.target;
                                        e.target.value = value.replace(/[^a-zA-Z ]/g, '');
                                    }}
                                />
                            </Grid>
                            <Grid item xs={12}>
                                <TextFieldStyled
                                    fullWidth
                                    variant='filled'
                                    size={"small"}
                                    InputLabelProps={{ shrink: true }}
                                    label='Description'
                                    placeholder='Description'
                                    inputProps={{ maxLength: 500 }}
                                    multiline
                                    rows={3}
                                    error={!!errors.description || apiErrors?.description}
                                    helperText={errors?.description?.message || apiErrors?.description}
                                    {...register('description', { required: registerData.descriptionReq, validate: value => value.trim() !== '' || registerData.descriptionReq })}
                                    onInput={(e) => {
                                        const { value } = e.target;
                                        e.target.value = value.replace(/[^a-zA-Z-. ]/g, '');
                                    }}
                                />
                            </Grid>
                            <Grid item xs={12} className='flex items-start'>
                                <FormGroup>
                                    <FormControlLabel
                                        control={<Switch checked={checked} onChange={() => setChecked(!checked)} />}
                                        label={registerData.landingPageVisibleLabel}
                                        labelPlacement="start"
                                        className='pl-2'
                                    />
                                </FormGroup>
                            </Grid>
                            <Grid item xs={12} className='flex gap-4 flex-wrap'>
                                {(websiteSettingsPermission?.editPermission === "Y" || websiteSettingsPermission?.writePermission === "Y") && (
                                    <Button variant='contained' type='submit'>
                                        {isButtonLoading ? <Loader type="btnLoader" /> : "Save Changes"}
                                    </Button>
                                )}
                            </Grid>
                        </Grid>
                    </form>
                </CardContent>
            )}
        </Card>
    )
}

export default FeatureSection