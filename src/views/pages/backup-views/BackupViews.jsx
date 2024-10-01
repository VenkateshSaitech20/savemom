'use client'
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import Button from '@mui/material/Button';
import CardContent from '@mui/material/CardContent';
import Grid from '@mui/material/Grid';

const BackupViews = () => {
    return (
        <Card>
            <CardHeader title='Download file for backup' className='pbe-4' style={{ textAlign: 'center' }} />
            <CardContent>
                <Grid container spacing={6} justifyContent="center" alignItems="center" style={{ textAlign: 'center', height: '100%' }}>
                    <Grid item xs={12} md={6} className='flex flex-col gap-6'>
                        <Button variant='contained' type='submit'>
                            Download file
                        </Button>
                    </Grid>
                </Grid>
            </CardContent>
        </Card >
    )
}

export default BackupViews
