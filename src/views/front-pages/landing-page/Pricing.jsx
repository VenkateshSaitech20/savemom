import { useCallback, useEffect, useState } from 'react';
import Link from 'next/link';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Switch from '@mui/material/Switch';
import Chip from '@mui/material/Chip';
import Button from '@mui/material/Button';
import InputLabel from '@mui/material/InputLabel';
import classnames from 'classnames';
import CustomAvatar from '@core/components/mui/Avatar';
import frontCommonStyles from '@views/front-pages/styles.module.css';
import apiClient from '@/utils/apiClient';
import Loader from '@/components/loader';

// const pricingPlans = [
//   {
//     title: 'Basic',
//     img: '/images/front-pages/landing-page/pricing-basic.png',
//     monthlyPay: 19,
//     annualPay: 14,
//     perYearPay: 168,
//     features: ['Timeline', 'Basic search', 'Live chat widget', 'Email marketing', 'Custom Forms', 'Traffic analytics'],
//     current: false
//   },
//   {
//     title: 'Team',
//     img: '/images/front-pages/landing-page/pricing-team.png',
//     monthlyPay: 29,
//     annualPay: 22,
//     perYearPay: 264,
//     features: [
//       'Everything in basic',
//       'Timeline with database',
//       'Advanced search',
//       'Marketing automation',
//       'Advanced chatbot',
//       'Campaign management'
//     ],
//     current: true
//   },
//   {
//     title: 'Enterprise',
//     img: '/images/front-pages/landing-page/pricing-enterprise.png',
//     monthlyPay: 49,
//     annualPay: 37,
//     perYearPay: 444,
//     features: [
//       'Campaign management',
//       'Timeline with database',
//       'Fuzzy search',
//       'A/B testing sanbox',
//       'Custom permissions',
//       'Social media automation'
//     ],
//     current: false
//   }
// ]

const PricingPlan = () => {
  const [pricingPlan, setPricingPlan] = useState('annually');
  const [planList, setPlanList] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const getData = useCallback(async () => {
    setIsLoading(true);
    const response = await apiClient.get('/api/website-settings/package-plans');
    if (response?.data?.result) {
      setPlanList(response?.data?.message);
    }
    setIsLoading(false);
  }, []);

  useEffect(() => {
    getData();
  }, []);

  const handleChange = e => {
    if (e.target.checked) {
      setPricingPlan('annually')
    } else {
      setPricingPlan('monthly')
    }
  }

  return (
    <>
      {isLoading && <Loader />}
      {!isLoading && (
        <section
          id='pricing-plans'
          className={'flex flex-col gap-8 lg:gap-12 plb-[100px] bg-backgroundDefault rounded-[60px]'}
        >
          <div className={classnames('is-full', frontCommonStyles.layoutSpacing)}>
            <div className='flex flex-col items-center justify-center gap-4 mbe-4'>
              <Chip size='small' variant='tonal' color='primary' label='Pricing Plans' />
              <div className='flex flex-wrap flex-col items-center justify-center gap-1 text-center'>
                <Typography variant='h4'>
                  <span className='relative z-[1] font-extrabold'>
                    Tailored pricing plans
                    <img
                      src='/images/front-pages/landing-page/bg-shape.png'
                      alt='bg-shape'
                      className='absolute block-end-0 z-[1] bs-[40%] is-[125%] sm:is-[132%] -inline-start-[10%] sm:inline-start-[-19%] block-start-[17px]'
                    />
                  </span>{' '}
                  designed for you
                </Typography>
                <Typography>
                  All plans include 40+ advanced tools and features to boost your product.
                  <br />
                  Choose the best plan to fit your needs.
                </Typography>
              </div>
            </div>
            <div className='flex justify-center items-center gap-3 max-sm:mlb-4 mbe-11'>
              <InputLabel htmlFor='pricing-switch' className='cursor-pointer'>
                Pay Monthly
              </InputLabel>
              <Switch id='pricing-switch' onChange={handleChange} checked={pricingPlan === 'annually'} />
              <InputLabel htmlFor='pricing-switch' className='cursor-pointer'>
                Pay Annually
              </InputLabel>
              <div className='flex gap-x-1 items-start max-sm:hidden mbe-5'>
                <img src='/images/front-pages/landing-page/pricing-arrow.png' alt='arrow image' width='50' />
                <Typography className='font-medium'>Save 25%</Typography>
              </div>
            </div>
            <Grid container spacing={6}>
              {planList?.map((plan) => (
                <Grid item key={plan.id} xs={12} lg={4}>
                  <Card className={classnames({ 'border-2 border-primary shadow-xl': plan.popularPlan === "Y" })}>
                    <CardContent className='flex flex-col gap-8 p-8 pbs-12'>
                      <div className='is-full flex flex-col items-center gap-3'>
                        <img src={plan.image} alt={plan.image} height='88' width='86' className='text-center' />
                      </div>
                      <div className='flex flex-col items-center gap-0.5 plb-2.5 relative'>
                        <Typography className='text-center' variant='h4'>
                          {plan.title}
                        </Typography>
                        <div className='flex items-baseline gap-1'>
                          <Typography variant='h2' color='primary' className='font-extrabold'>
                            ${pricingPlan === 'monthly' ? plan.monthlyPrice : plan.yearlyPlan.monthly}
                          </Typography>
                          <Typography color='text.disabled' className='font-medium'>
                            /mo
                          </Typography>
                        </div>
                        {pricingPlan === 'annually' && (
                          <Typography variant='caption' className='absolute block-end-[-9px]'>
                            ${plan.yearlyPlan.annually} / year
                          </Typography>
                        )}
                      </div>
                      <div>
                        <div className='flex flex-col gap-3'>
                          {plan.planBenefits.map((plan) => (
                            <div key={plan.id} className='flex items-center gap-2.5'>
                              {/* <CustomAvatar color='primary' skin={plan.current ? 'filled' : 'light'} size={16}> */}
                              <CustomAvatar color='primary' skin={'light'} size={16}>
                                <i className='bx-check text-xs' />
                              </CustomAvatar>
                              <Typography variant='h6'>{plan.feature}</Typography>
                            </div>
                          ))}
                        </div>
                      </div>
                      {/* <Button component={Link} href='/front-pages/payment' variant={plan.current ? 'contained' : 'tonal'}> */}
                      <Button component={Link} href='/front-pages/payment' variant={'contained'}>
                        Get Started
                      </Button>
                    </CardContent>
                  </Card>
                </Grid>
              ))}
            </Grid>
          </div>
        </section>
      )}
    </>

  )
}

export default PricingPlan