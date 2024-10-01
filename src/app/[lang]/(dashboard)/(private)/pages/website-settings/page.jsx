import dynamic from 'next/dynamic'
import WebsiteSettings from '@views/pages/website-settings'

const FirstSection = dynamic(() => import('@views/pages/website-settings/first-section'))
const SecondSection = dynamic(() => import('@views/pages/website-settings/second-section'))
const Testimonial = dynamic(() => import('@/views/pages/website-settings/testimonial'))
const Brand = dynamic(() => import('@/views/pages/website-settings/brand'))
const OurTeam = dynamic(() => import('@views/pages/website-settings/our-team'))
const KeyAchievements = dynamic(() => import('@views/pages/website-settings/key-achievements'))
const Faqs = dynamic(() => import('@views/pages/website-settings/faqs'))
const ContactUs = dynamic(() => import('@views/pages/website-settings/contact-us'))

// Vars
const tabContentList = () => ({
    'first-section': <FirstSection />,
    'second-section': <SecondSection />,
    'testimonial': <Testimonial />,
    'brand': <Brand />,
    'our-team': <OurTeam />,
    'key-achievements': <KeyAchievements />,
    'faqs': <Faqs />,
    'contact-us': <ContactUs />
})

const websiteSettingsPage = () => {
    return <WebsiteSettings tabContentList={tabContentList()} />
}

export default websiteSettingsPage
