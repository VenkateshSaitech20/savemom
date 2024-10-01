// Next Imports
import Link from 'next/link'

// MUI Imports
import Typography from '@mui/material/Typography'
import Button from '@mui/material/Button'
import Grid from '@mui/material/Grid'

// Third-party Imports
import classnames from 'classnames'

// Styles Imports
import frontCommonStyles from '@views/front-pages/styles.module.css'

const FreeTrial = () => {
  return (
    <section className='bg-primaryLight mbs-[60px]'>
      <div className={classnames('flex justify-between flex-wrap md:relative', frontCommonStyles.layoutSpacing)}>
        <Grid container spacing={2}>
          <Grid item xs={12} md={6}>
            <div className='flex flex-col gap-11 items-center md:items-start justify-center plb-11'>
              <div className='flex flex-col gap-2 max-md:text-center'>
                <Typography variant='h4' color='primary'>
                  Still not convinced? Start with a 14-day FREE trial!
                </Typography>
                <Typography>You will get full access to with all the features for 14 days.</Typography>
              </div>
              <Button component={Link} href='/front-pages/payment' variant='contained'>
                Start 14-Days Free Trial
              </Button>
            </div>
          </Grid>
          <Grid item xs={12} md={6}>
            <div className='md:absolute block-end-0 md:inline-end-6 xl:inline-end-0 flex justify-center'>
              <img src='/images/illustrations/characters/1.png' alt='girl with laptop' className='bs-[270px]' />
            </div>
          </Grid>
        </Grid>
      </div>
    </section>
  )
}

export default FreeTrial
