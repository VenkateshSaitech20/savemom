// MUI Imports
import Typography from '@mui/material/Typography'
import Breadcrumbs from '@mui/material/Breadcrumbs'
import Grid from '@mui/material/Grid'
import Divider from '@mui/material/Divider'
import InputAdornment from '@mui/material/InputAdornment'

// Third-party Imports
import classnames from 'classnames'

// Component Imports
import Link from '@components/Link'
import CustomTextField from '@core/components/mui/TextField'
import DirectionalIcon from '@components/DirectionalIcon'

// Styles Imports
import frontCommonStyles from '@views/front-pages/styles.module.css'

// Data
const articleList = [
  'Template Kits',
  'Elementor Template Kits: PHP Zip Extends',
  'Envato Elements Template Kits',
  'Envato Elements Template Kits',
  'How to use the template in WordPress',
  'How to use the Template Kit Import'
]

const Questions = () => {
  return (
    <section className='md:pbe-[100px] pbe-[50px] pbs-[80px] -mbs-[80px] bg-backgroundPaper'>
      <div className={classnames('pbs-[50px] md:pbs-[100px]', frontCommonStyles.layoutSpacing)}>
        <Grid container spacing={6}>
          <Grid item xs={12} lg={8}>
            <div className='flex flex-col gap-2'>
              <Breadcrumbs aria-label='breadcrumb'>
                <Link className='hover:text-primary' href='/front-pages/help-center'>
                  Help Center
                </Link>
                <Typography>How to add product in cart</Typography>
              </Breadcrumbs>
              <Typography variant='h4'>How to add product in cart?</Typography>
              <Typography>1 month ago - Updated</Typography>
            </div>
            <Divider className='mlb-6' />
            <div className='flex flex-col gap-6'>
              <div>
                <Typography className='mbe-4'>
                  If you&apos;re after only one item, simply choose the &apos;Buy Now&apos; option on the item page.
                  This will take you directly to Checkout.
                </Typography>
                <Typography>
                  If you want several items, use the &apos;Add to Cart&apos; button and then choose &apos;Keep
                  Browsing&apos; to continue shopping or &apos;Checkout&apos; to finalize your purchase.
                </Typography>
              </div>
              <img src='/images/front-pages/product.png' alt='product image' className='is-full max-is-auto' />
              <Typography>
                You can go back to your cart at any time by clicking on the shopping cart icon at the top right side of
                the page.
              </Typography>
              <img src='/images/front-pages/checkout.png' alt='checkout image' className='is-full max-is-auto' />
            </div>
          </Grid>
          <Grid item xs={12} lg={4} className='flex flex-col gap-6'>
            <CustomTextField
              placeholder='Search...'
              InputProps={{
                startAdornment: (
                  <InputAdornment position='start'>
                    <i className='bx-search' />
                  </InputAdornment>
                )
              }}
            />
            <div className='flex flex-col gap-4'>
              <div className='pli-6 plb-2 bg-actionHover rounded'>
                <Typography variant='h5'>Articles in this section</Typography>
              </div>
              <div className='flex flex-col gap-4'>
                {articleList.map((article, index) => (
                  <Typography
                    key={index}
                    component={Link}
                    color='text.primary'
                    className='flex gap-2 justify-between hover:text-primary'
                  >
                    <Typography color='inherit'>{article}</Typography>
                    <DirectionalIcon
                      className='text-textDisabled text-xl'
                      ltrIconClass='bx-chevron-right'
                      rtlIconClass='bx-chevron-left'
                    />
                  </Typography>
                ))}
              </div>
            </div>
          </Grid>
        </Grid>
      </div>
    </section>
  )
}

export default Questions