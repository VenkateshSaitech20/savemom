export const validations = {
  regNamePattern: /^(?=.*[a-zA-Z].*[a-zA-Z])[a-zA-Z&,\-'()\s\d]+$/,
  namePattern: /^(?=.*[a-zA-Z].*[a-zA-Z])[a-zA-Z\-\_\s\d]+$/,
  emailPattern: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/,
  cinPattern: /^[UL]{1}[0-9]{5}[A-Z]{2}[0-9]{4}[A-Z]{3}[0-9]{6}$/,
  gstPattern: /^([0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[A-Z]{1}[0-9A-Z]{1})$/,
  aadharPattern: /^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$/,
  // numPattern: /^(?!0)\d+$/,
  numPattern: /^(?!0)\d+$/,
  alphaNumSpacePattern: /^[a-zA-Z0-9\s]+$/,
  alphaNumSpaceSHPattern: /^(?=.*[a-zA-Z].*[a-zA-Z])[a-zA-Z\d]+$/, //sht name
  numSpacePattern: /^(?!0+$)[0-9\s.,]+$/,
  numSpaceZeroPattern: /^(?!0)\d*(?:\.\d+)?$/, //not starts with zero
  longPattern: /^(\+?\-?(([0-9]|[1-9][0-9]|1[0-7][0-9])(\.\d{1,6})?|180(\.0{1,6})?))$/,
  latPattern: /^(\+?\-?(([0-9]|[1-8][0-9])(\.\d{1,6})?|90(\.0{1,6})?))$/,
};

export const registerData = {
  // Required message
  nameReq: 'Name is required',
  emailReq: 'Email is required',
  passwordReq: 'Password is required',
  currentPasswordReq: 'Current Password is required',
  newPasswordReq: 'New Password is required',
  confirmPasswordReq: 'Confirm Password is required',
  confirmPasswordValMsg: "Password doesn't match",
  passwordResetExpired: "Link is expired",
  roleNameReq: "Role Name is required",
  phoneReq: "Phone Number required",
  profileStatusReq: "Profile Status is required",
  statusReq: "Status is required",
  countryNameReq: "Country Name is required",
  emailTypeReq: "Email type is required",
  addressReq: "Address is required",
  systemNameReq: "System Name is required",
  descriptionReq: "Description is required",
  companyNameReq: "Company Name is required",
  titleReq: "Title is required",
  subTitleReq: "Sub Title is required",
  monthlyPriceReq: "Monthly Price is required",
  keyMetricReq: "Key metric is required",
  highlightReq: "Highlight is required",
  metaDescriptionReq: "Meta Description is required",
  buttonNameReq: "Button Name is required",
  metaTitleReq: "Meta Title is required",
  tokenReq: "Token is required",
  badgeTitleReq: "Badge Title is required",
  quesReq: "Question is required",
  ansReq: "Answer is required",
  designationReq: "Designation is required",
  ratingReq: "Rating is required",
  postedByReq: "Name is required",
  messageReq: "Message is required",
  planBenefitsReq: "planBenefits is Required",
  publicKeyReq: "Public Key is required",
  privateKeyReq: "Private Key is required",
  typeReq: "Type is required",
  keymetricsReq: "Keymetrics is required ",
  categoryReq: "Category is required",
  sortnameReq: "Short Name is required",
  phnCodeReq: "Phone Code is required",
  discountReq: "Discount is required",

  // Validation message
  phnLength: 10,
  phoneValLengthMsg: 'Phone number must be exactly 10 digits.',
  phoneValMsg: 'Phone number cannot consist solely of zeros or start with zero',
  emailValMsg: 'Invalid email address',
  addressValMsg: 'Invalid address',
  permissionValMsg: 'Select atleast one permission',
  accountPendingMsg: 'Account is not verified. Please contact admin',
  accountInactiveMsg: 'Account is not active. Please contact admin',
  paymentgatewayMsg: "You can't delete this. Because you choose this method as a primary",
  categoryValMsg: 'Invalid category',
  nameFieldVal: "Name should only contain letters and spaces",
  countryFieldVal: "Country should only contain letters and spaces",
  sortnameFieldVal: "Short Name should only contain letters.",
  phoneCodeFieldVal: "Phone Code should only contain numbers.",
  companyFieldVal: "Company should only contain letters and spaces",
  statusFieldVal: "Status should only contain letters and spaces",
  roleFieldVal: "Role should only contain letters and spaces",
  zipFieldVal: "Zip number should only contain letters and spaces",
  systemNameFieldVal: "System Name should only contain letters and spaces",
  metaDescFieldVal: "Meta Description should only contain letters and spaces and some special charactors",
  metaTagFieldVal: "Meta Title should only contain letters and spaces",
  titleFieldVal: "Title should only contain letters and spaces",
  subTitleFieldVal: "Sub Title should only contain letters and spaces",
  buttonFieldVal: "Button should only contain letters and spaces",
  descriptionFieldVal: "Description should only contain letters and spaces and some special charactors",
  messageFieldVal: "Message should only contain letters and spaces and some special charactors",
  designationFieldVal: "Designation should only contain letters and spaces and some special charactors",
  badgeFieldVal: "should only contain letters and spaces",
  ratingFieldVal: "Rating must between 1 to 5 without decimal",
  monthlyPriceFieldVal: "Monthly Price should only contain Numbers",
  questionFieldVal: "Question should only contain letters and spaces and some special charactors",
  answerFieldVal: "Answer should only contain letters and spaces and some special charactors",
  typeFieldVal: "Type should only contain letters and spaces",
  discountFieldVal: "Discount should only contain number and range between 1 to 100",
  keyMetricFieldVal: "KeyMetric should only contain letters and spaces and some special charactors",
  highlightFieldVal: "Highlight should only contain letters and spaces and some special charactors",
  // Others
  landingPageVisibleLabel: "Is landing page visible?",
}

export const responseData = {
  userCreated: "User created successfully",
  roleUpdeted: "Role updated successfully",
  roleAdded: "Role added successfully",
  roleGet: "Role get successfully",
  profileUpdated: "Profile updated successfully",
  emailExists: "Email already taken",
  roleExist: "Role Name already exist",
  countryExists: "Country already exists",
  sortnameExists: "Short Name already exists",
  phnCodeExists: "Phone Code already exists",
  delSuccess: "Data deleted successfully",
  userDeleted: "User deleted successfully",
  categoryAlreadyExist: "Category already exist",
  testimonialDeleted: "Testimonial deleted successfully",
  roleDel: "Role deleted successfully",
  notFound: "No data found",
  userNotFound: "User not found",
  noEmailFound: "No email found",
  notValiduser: "You cant update the user profile",
  contactNoExists: "Mobile No already taken",
  titleExists: "Title already exist",
  menuAdded: "Menu added successfully",
  menuExists: "Menu already exist",
  passwordMismatch: "Password do not match",
  passwordResetSuccess: "Password has been reset successfully",
  passwordChanged: "Password changed successfully",
  passwordNotValid: "Current Password is not valid",
  tokenExpired: "TokenExpiredError",
  invalidToken: "Token is missing / Invalid token",
  systemSettingsUpdated: "System settings updated successfully",
  systemSettingNotFound: "System settings not found",
  bannerDetailsUpdated: "Banner details updated successfully",
  bannerNotFound: "Banner details not found",
  dashboardImageLightReq: "Dashboard Light Image is Required",
  dashboardImageDarkReq: "Dashboard Dark Image is Required",
  invalidFileType: "Invalid file type. Only JPG and PNG are allowed",
  dataUpdated: "Data updated successfully",
  dataCreateded: "Data created successfully",
  templateCreateded: "Template created successfully",
  templateupdated: "Template updated successfully",
  noData: "No data",
  enquirySubmitted: "Enquiry submitted successfully",
  emailSubscribed: "News letter subscribed",
  existSubscribed: "Email already subscribed",
  packagePlanDeleted: "Plan deleted successfully",
  emailSentSuccMsg: "Email sent successfully!",
  bannerDetailsCreated: "Banner details created successfully",
  statusChanged: "Status Changed Successfully",
  achievementDeleted: "Achievement deleted successfully",
};

export const otherData = {
  fileLimitText: "Allowed JPG, PNG. Max size of 1MB",
  profileImgDim: "200*200",
  systemImgDim: "128*128",
  favIconDim: "128*128",
  dashboardImgLightDim: "2280*1390",
  dashboardImgDarkDim: "2280*1382",
  secondSecImgDim: "60*60",
  reviewImgDarkDim: "100*30",
  headerTitle: "All in one sass application for your business",
  headerDescription: "No coding required to make customizations. The live customizer has everything your marketing need.",
  buttonText: "Get Early Access",
  teamImgDim: "220*240",
  keyAchivementImgDim: "65*65",
  packagePlanImgDim: "240*240",
}

export const profileStatus = [{ id: "1", status: 'Pending' }, { id: "2", status: 'Active' }, { id: "3", status: 'Inactive' }];

export const countryData = [{ id: "1", name: 'India' }, { id: "2", name: 'USA' }, { id: "3", name: 'Australia' }, { id: "4", name: 'Germany' }];

export const plansData = [{ id: "1", plan: 'Basic' }, { id: "2", plan: 'Company' }, { id: "3", plan: 'Enterprise' }, { id: "4", plan: 'Team' }];

export const languages = [{ id: "1", name: 'English' }, { id: "2", name: 'French' }];

export const pageList = [
  // { value: "1" },
  { value: "10" },
  { value: "25" },
  { value: "50" },
]

export const emailType = [
  { id: "1", value: 'gmail', name: 'Gmail' },
  { id: "3", value: 'yahoo', name: 'Yahoo Mail' },
  { id: "4", value: 'zoho', name: 'Zoho Mail' }
];

export const types = [{ id: "1", type: 'Live' }, { id: "2", type: 'Demo' }];

export const status = [
  { id: 1, value: 'Y', name: "Active" },
  { id: 2, value: 'N', name: "In Active" }
]

export const validity = { monthly: "28", yearly: "365" };
