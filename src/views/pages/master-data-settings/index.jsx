import dynamic from 'next/dynamic'
import Ecommerce from '@views/apps/ecommerce/index'
import { getEcommerceData } from '@/app/server/actions'

const ProductListTable = dynamic(() => import('@views/apps/ecommerce/products/list/ProductListTable'))
const CustomerListTable = dynamic(() => import('@views/apps/ecommerce/customers/list/CustomerListTable'))

const data = await getEcommerceData()

// Vars
const tabContentList = () => ({
    'ProductListTable': <ProductListTable productData={data?.products} />,
    'CustomerListTable': <CustomerListTable customerData={data?.customerData} />,
})

const websiteSettingsPage = () => {
    return <Ecommerce tabContentList={tabContentList()} />
}

export default websiteSettingsPage
