import dynamic from 'next/dynamic'
import MasterDataSettings from '@views/pages/master-data-settings'

const Country = dynamic(() => import('@views/pages/master-data-settings/country'))

// Vars
const tabContentList = () => ({
    'country': <Country />,
})

const MasterDataSettingsPage = () => {
    return <MasterDataSettings tabContentList={tabContentList()} />
}

export default MasterDataSettingsPage

