// import 'dart:math';
//
// import 'package:jadu_ride_driver/translations_generated_files/locale_keys.g.dart';
//
// class StringProvider {
//   static const appUpdate = "Version Update";
//
//   static const appName = "Jadu Ride";
//
//   static var appId = Random.secure().toString();
//
//   static const okay = "OKAY";
//
//
//   static var recharge = "Recharge";
//
//   static const notYet = "Not yet";
//
//   static var paymentGatewayOpening = "Payment Gateway Opening...";
//
//   static const noInternet = "No Internet";
//
//   static const error = "Error";
//
//   static var unableToOpenPaymentGateway =
//       "Unable to open payment gateway....Try Again";
//
//   static var rechargeYourWallet = "Recharge Your Wallet";
//
//   static var selectAnyAmountForRecharge = "Select Any Amount For Recharge";
//
//   static var someNetworkIssueisHappening = "Some Network Issue is Happening..";
//
//   static const retry = "Retry";
//
//   static const skip = "Skip";
//
//   static const proceed = "Proceed";
//
//   static const pleaseWait = "Please wait";
//
//   static const register = "Register";
//
//   static const login = "Login";
//
//   static const enterMobileNumber = LocaleKeys.enter_your_phone_number;
//
//   static const enterNumberDescription =
//       "This number will be used to contact you and\ncommunicate all ride related details";
//
//   static const mobileNumber = "Mobile Number";
//   static const tollFreeMobileNumber = "Toll Free";
//   static const orTxt = "or";
//
//   static const next = "NEXT";
//
//   static const enterOtp = "Enter the OTP sent to\n";
//
//   static const dintRecieveCode = "Didn't receive a code ?\t";
//
//   static const recieveing = "Receiving...";
//
//   static const recieve = "Receive";
//   static const from = "From -";
//   static const to = "To -";
//   static const customarName = "Customer Name : ";
//   static const pickUpLocation = "PICKUP LOCATION";
//   static const navigatesTxt = "NAVIGATE";
//   static const dropLocation = "DROP LOCATION";
//   static const customarBookingId = "Booking ID: : ";
//
//   static const todaysPayment = "TODAY'S PAYMENT";
//
//   static const currentBalanceDate = "June 17, 2022";
//
//   static const noBalance = "no balance to be paid today";
//
//   static const paymentSummery = "PAYMENT'S SUMMARY";
//
//   static const verifyNow = "VERIFY NOW";
//
//   static const selectPrefferedLanguage = LocaleKeys.select_preffered_language;
//
//   static const languageChangedSuccessfully =
//       LocaleKeys.language_changed_successfully;
//
//   static const welcomeToJaduRide =
//       "Welcome new Jadu Ride\nPartner! Drive forward.";
//
//   static const pleaseEnterPartnerDetails = "Please enter the partner details";
//
//   static const continuee = "CONTINUE";
//
//   static const enterYourName = "Your name";
//
//   static const enterYourEmail = "Your email";
//
//   static const notItems = "No items";
//
//   static const referralCode = "Referral code";
//
//   static const agreeToJaduRideTermsAndCondition =
//       "Agree to Jadu Ride Terms & Conditions";
//
//   static const thisFieldIsMandatory = "*This field is mandatory.";
//
//   static const addYourVehicle = "Add your vehicle\nto Continue";
//
//   static const pleaseEnterTheRequiredField =
//       "Please enter the required details";
//
//   static const vehicleNumber = "Vehicle Number";
//
//   static const welcome = "Welcome";
//
//   static const pleaseCompleteRequied =
//       "Please complete the require steps and start\ndriving with Jadu Ride.";
//
//   static const criticalError = "Critical Error";
//
//   static const weAreFacingSomeError =
//       "We are facing some error in our backend please retry. Sorry for this inconvenience.";
//
//   static const indentifyDetails = "Identify Details";
//
//   static const profilePicture = "Profile Picture";
//
//   static const driverLicense = "Driver License";
//
//   static const aadharCard = "Aadhar Card";
//
//   static const vehicleInsurance = "Vehicle Insurance";
//
//   static const registrationCertificate = "Registration Certificate (RC)";
//
//   static const panCard = "Pan Card";
//
//   static const vehiclePermit = "Vehicle Permit";
//
//   static const vehicleAudit = "Vehicle Audit";
//
//   static const paymentDetails = "Payment Details";
//
//   static const manageProfile = "Manage Profile";
//
//   static var necessarySteps = "Necessary Steps";
//
//   static var optionalSteps = "Optional Steps";
//
//   static var setting = "Setting";
//
//   static var profileSetting = "Profile Setting";
//
//   static const youHaveToCompleteRequiredFields =
//       "You have to complete necessary steps to continue.";
//
//   static var cancelOrReset = "Cancel & Reset";
//
//   static var done = "Done";
//
//   static var selectOrChoosePicture = "Select/Choose Picture";
//
//   static var imageChooseGuidLine = "Image upload guideline 1";
//
//   static var imageChooseGuidLine2 = "Image upload guideline 2";
//
//   static var chooseSource = "Choose Source";
//
//   static var camera = "Camera";
//
//   static var gallery = "Gallery";
//
//   static var crop = "Crop";
//
//   static var pleaseEnterDrivingLicenseNumber =
//       "Please Enter Driving License Number";
//
//   static var driverLicenseNumber = "Driver License Number";
//
//   static var reEnterDriverLicenseNumber = "Re-Enter Driver License number";
//
//   static var dateOfBirth = "Date of Birth";
//
//   static var uploadDriverLicense = "Upload Driver License";
//
//   static var didNotMatched = "Number did not matched!";
//
//   static var addharCard = "Aadhar Card";
//
//   static var enterAdharCardNumber = "Please Enter Aadhar Card Number";
//
//   static var aadharCardNumber = "Aadhar Card Number";
//
//   static var aadharCardPhoto = "Aadhar Card Photo";
//
//   static var invalidAadhar = "Invalid aadhar number!";
//
//   static var doYouHaveValidInsurance =
//       "Do you have\nvalid insurance document ?";
//
//   static var yes = "YES";
//
//   static var no = "NO";
//
//   static var pleaseEnterVehicleInsuranceNumber =
//       "Please Enter Vehicle Insurance Number";
//
//   static var vehicleInsuranceNumber = "Vehicle Insurance Number";
//
//   static var uploadVechicle = "Upload Vehicle Insurance";
//
//   static var validTill = "Valid Till";
//
//   static var pleaseEnterValidityOfYourInsurance =
//       "Please Give Validity of Insurance";
//
//   static var set = "SET";
//
//   static var uploadRegistrationCertificate =
//       "Upload Registration Certificate (RC)";
//
//   static var uploadPanImage = "Upload Pan Image";
//
//   static var pleaseEnterPanCardNumber = "Please Enter Pancard Number";
//
//   static var panNumber = "Pan Number";
//
//   static var invalidPan = "Invalid Pan Number";
//
//   static var isYourVehiclePermitIssued = "Is your Vehicle Permit Issued?";
//
//   static var pleaseEnterVehiclePermitNumber =
//       "Please Enter Vehicle Permit Number";
//
//   static var issuedOn = "Issued On";
//
//   static var issuedDateOfVehiclePermit =
//       "Please Give Issued Date of Vehicle's Permit";
//
//   static var vehiclePermitNumber = "Vehicle Permit Number";
//
//   static var uploadVehiclePermit = "Upload Vehicle Permit";
//
//   static var requiredSteps = "Required Steps";
//
//   static var expiryDateOfLicense = "Please Give Expiry Date Of License";
//
//   static var expiry = "Expiry Date";
//
//   static var vehiclePollution = "Vehicle Pollution";
//
//   static var chasisNumberImage = "Chasis Number Image";
//
//   static var backSideWithNumberPlate = "Back Side With Number Plate";
//
//   static var leftSideExterior = "Left Side Exterior";
//
//   static var rightSideExterior = "Right Side Exterior";
//
//   static var carInside = "Car Inside";
//
//   static var enterChaisNumber = "Please Enter Chasis Number";
//
//   static var chasisNumber = "Chasis Number";
//
//   static var upload = "Upload";
//
//   static var vehicleAuditCompleted = "Vehicle Audit Completed Successfully!";
//
//   static var pleaseGiveYourPollutionExpiryNumber =
//       "Please Give Your Pollution Expiry Date";
//
//   static var expiryDate = "Expiry Date";
//
//   static var uploadPollutionPaper = "Upload Pollution Paper";
//
//   static var close = "Close";
//   static var save = "Save";
//
//   static var saveAndProcced = "Save and Proceed";
//   static var tripId = "ID: ";
//
//   static var rechargeNow = "RECHARGE NOW";
//   static var callNowTxt = "Call Now";
//
//   static var thisQuestionIsMandatory = "*This question is mandatory.";
//
//   static var defaultPaymentMethod = "Default Payment Method";
//
//   static var selectYourUpi = "Select Your UPI App";
//
//   static var uploadQrCode = "Upload QR Code";
//
//   static var enterYourUpiID = "Enter your UPI ID";
//
//   static var upiId = "UPI ID";
//
//   static var UpiIsValid = "Upi is valid!";
//
//   static var UpiIsInValid = "Upi is invalid!";
//
//   static var provideYourAlternatePaymentDetails =
//       "Provide Your Alternate Payment Details";
//
//   static var enterUpiId = "Enter UPI ID";
//
//   static var toDashboard = "To Dashboard";
//
//   static var applicationSubmitted = "Your Application Submitted";
//
//   static var applicationSubmittedDescription =
//       "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
//
//   static var enableGpsMessage =
//       "Please enable your Location Service/GPS, We need this for getting your current location.";
//
//   static var permissionRationaleMessage =
//       "For driving with us we need to access your current location. Without this we can't provide any service to you, so please allow this permission.";
//
//   static var locationDeniedForever =
//       "To give your location permission, go to app settings and change current setting";
//
//   static var appSetting = "App Setting";
//
//   static var enableLocationMessage =
//       "Please enable your GPS/Location Service, Otherwise you might not receive any bookings and cannot use our services either.";
//
//   static const duty = "Duty";
//
//   static const accounts = "Accounts";
//   static const onlineCollect = "ONLINE COLLECTED";
//   static const cashCollect = "CASH COLLECTED";
//   static const amountTransfer = "AMOUNT TRANSFER BY DAY";
//
//   static const incentives = "Incentives";
//
//   static const partnerCare = "Partner Care";
//   static const scheduleTrip = "Schedule Trips";
//
//   static const userName = "Mukesh Janha";
//
//   static const userProfile = "Manage Profile";
//
//   static const schedule = "Schedule";
//
//   static const more = "More";
//
//   static const bookingCount = "Booking Count";
//
//   static const operatorBill = "Operator Bill";
//
//   static var lastUpdated = "Last Updated: ";
//
//   static var accountSummary = "Account Summary";
//
//   static var todaysPayments = "Today's Payment";
//   static var amountTransfferedByDay = "Amount Transferred by day";
//   static var paymentsSummery = "Payment Summery";
//   static var referList = "Refer List";
//   static var refer = "Refer";
//   static var termsAndConditions = "Terms and Condition";
//   static var refundPolicy = "Refund Policy";
//   static var helpTxt = "Help";
//   static var emergencyTxt = "Emergency Support";
//   static var privacyPolicy = "Privacy Policy";
//   static var tripsTxt = "Trips";
//
//   static var currentBalanceTitle = "Balance";
//
//   static var currentBalanceKM_TXT = "KM";
//   static var referToDriver = "Refer to Driver";
//   static var referToCustomer = "Refer to Customer";
//
//   static var accountSummaryDescription =
//       "Lorem Ipsum is simply dummy \n text of the printing text of the printing";
//   static var toDriver = "1";
//   static var terms =
//       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
//
//   static var pickUp = "PICKUP";
//
//   static var navigate = "Navigate";
//
//   static var clientLocated = "Client Located";
//
//   static var arrivingToCustomerIn = "Arriving To Customer In";
//
//   static var waitingForCustomer = "Waiting for Customer";
//
//   static var startTrip = "Start Trip";
//
//   static var verifyOtp = "Verify OTP";
//
//   static var yourStops = "Swipe Up to see Your Stops";
//
//   static var endTrip = "End Trip";
//
//   static var notAvailable = "Not Available";
//
//   static var amountCollected = "Amount Collected";
//
//   static var scanQrCodeToPay = "Scan QR Code to Pay";
//
//   static var rateYourCustomer = "Rate Your Customer";
//
//   static var saySomethingAboutYourExp = "Say something about your experience!";
//
//   static var submit = "Submit";
//
//   static var jaduRideDirectionNavigationServiceID =
//       "jadu_ride_direction_navigation_service_id";
//
//   static var jaduRideDirectionNavigationService =
//       "JaduRide Direction Navigation Service";
//
//   static var areYouReallyWantToLogout = "Are you really want to Logout ?";
//
//   static var Yes = "Yes";
//
//   StringProvider._();
//
//   static const appVersion = "AppVersion";
//
//   //add by palash
//   static const lowBalance = "Your balance is low! ";
//   static const duesAreNot = "Your bookings may drop if dues are not";
//   static const clearImd = "cleared immediately";
//   static const submitBtn = "Submit";
//   static const currentBalance = "Current Balance";
// }
import 'dart:math';

import 'package:jadu_ride_driver/translations_generated_files/locale_keys.g.dart';

class StringProvider {
  static const appUpdate = "Version Update";

  static const appName = "Jadu Ride";

  static var appId = Random.secure().toString();

  static const okay = "OKAY";

  static var paymentId = "Payment ID: ";

  static var rechargeSuccesful = "RechargeSuccesful";

  static var reason = "Reason: ";

  static var rechargeSuccessful = "Recharge Successful";

  static var back = "Back";

  static var paymentVia = "Payment Via: ";

  static var recharge = "Recharge";

  static const notYet = "Not yet";

  static var balancetitle = "Purchase Kilometer";

  static var paymentGatewayOpening = "Payment Gateway Opening...";

  static const noInternet = "No Internet";

  static const error = "Error";

  static var unableToOpenPaymentGateway =
      "Unable to open payment gateway....Try Again";

  static var rechargeYourWallet = "Recharge Your Wallet";

  static var selectAnyAmountForRecharge = "Select Any Amount For Recharge";

  static var someNetworkIssueisHappening = "Some Network Issue is Happening..";

  static const retry = "Retry";

  static const skip = "Skip";

  static const proceed = "Proceed";

  static const pleaseWait = "Please wait";

  static const register = "Register";

  static const login = "Login";

  static const enterMobileNumber = LocaleKeys.enter_your_phone_number;

  static const enterNumberDescription =
      "This number will be used to contact you and\ncommunicate all ride related details";

  static const mobileNumber = "Mobile Number";
  static const tollFreeMobileNumber = "Toll Free";
  static const orTxt = "or";

  static const next = "NEXT";

  static const enterOtp = "Enter the OTP sent to\n";

  static const dintRecieveCode = "Didn't receive a code ?\t";

  static const recieveing = "Receiving...";

  static const recieve = "Receive";
  static const from = "From -";
  static const to = "To -";
  static const origin = "From";
  static const destination = "To";
  static const customarName = "Customer Name : ";
  static const pickUpLocation = "PICKUP LOCATION";
  static const navigatesTxt = "NAVIGATE";
  static const dropLocation = "DROP LOCATION";
  static const customarBookingId = "Booking ID: : ";

  static const todaysPayment = "TODAY'S PAYMENT";

  static const currentBalanceDate = "June 17, 2022";

  static const noBalance = "no balance to be paid today";

  static const paymentSummery = "PAYMENT'S SUMMARY";

  static const verifyNow = "VERIFY NOW";

  static const selectPrefferedLanguage = LocaleKeys.select_preffered_language;

  static const languageChangedSuccessfully =
      LocaleKeys.language_changed_successfully;

  static const welcomeToJaduRide =
      "Welcome new Jadu Ride\nPartner! Drive forward.";

  static const pleaseEnterPartnerDetails = "Please enter the partner details";

  static const continuee = "CONTINUE";

  static const enterYourName = "Your name";

  static const enterYourEmail = "Your email";

  static const notItems = "No items";

  static const referralCode = "Referral code";

  static const agreeToJaduRideTermsAndCondition =
      "Agree to Jadu Ride Terms & Conditions";

  static const thisFieldIsMandatory = "*This field is mandatory.";

  static const addYourVehicle = "Add your vehicle\nto Continue";

  static const pleaseEnterTheRequiredField =
      "Please enter the required details";

  static const vehicleNumber = "Vehicle Number";

  static const welcome = "Welcome";

  static const pleaseCompleteRequied =
      "Please complete the require steps and start\ndriving with Jadu Ride.";

  static const criticalError = "Critical Error";

  static const weAreFacingSomeError =
      "We are facing some error in our backend please retry. Sorry for this inconvenience.";

  static const indentifyDetails = "Identify Details";

  static const profilePicture = "Profile Picture";

  static const driverLicense = "Driver License";

  static const aadharCard = "Aadhar Card";

  static const vehicleInsurance = "Vehicle Insurance";

  static const registrationCertificate = "Registration Certificate (RC)";

  static const panCard = "Pan Card";

  static const vehiclePermit = "Vehicle Permit";

  static const vehicleAudit = "Vehicle Audit";

  static const paymentDetails = "Payment Details";

  static const manageProfile = "Manage Profile";

  static var necessarySteps = "Necessary Steps";

  static var optionalSteps = "Optional Steps";

  static var setting = "Setting";

  static var profileSetting = "Profile Setting";

  static const youHaveToCompleteRequiredFields =
      "You have to complete necessary steps to continue.";

  static var cancelOrReset = "Cancel & Reset";

  static var done = "Done";

  static var selectOrChoosePicture = "Select/Choose Picture";

  static var imageChooseGuidLine = "Image upload guideline 1";

  static var imageChooseGuidLine2 = "Image upload guideline 2";

  static var chooseSource = "Choose Source";

  static var camera = "Camera";

  static var gallery = "Gallery";

  static var crop = "Crop";

  static var pleaseEnterDrivingLicenseNumber =
      "Please Enter Driving License Number";

  static var driverLicenseNumber = "Driver License Number";

  static var reEnterDriverLicenseNumber = "Re-Enter Driver License number";

  static var dateOfBirth = "Date of Birth";

  static var uploadDriverLicense = "Upload Driver License";

  static var didNotMatched = "Number did not matched!";

  static var addharCard = "Aadhar Card";

  static var enterAdharCardNumber = "Please Enter Aadhar Card Number";

  static var aadharCardNumber = "Aadhar Card Number";

  static var aadharCardPhoto = "Aadhar Card Photo";

  static var invalidAadhar = "Invalid aadhar number!";

  static var doYouHaveValidInsurance =
      "Do you have\nvalid insurance document ?";

  static var yes = "YES";

  static var no = "NO";

  static var pleaseEnterVehicleInsuranceNumber =
      "Please Enter Vehicle Insurance Number";

  static var vehicleInsuranceNumber = "Vehicle Insurance Number";

  static var uploadVechicle = "Upload Vehicle Insurance";

  static var validTill = "Valid Till";

  static var pleaseEnterValidityOfYourInsurance =
      "Please Give Validity of Insurance";

  static var set = "SET";

  static var uploadRegistrationCertificate =
      "Upload Registration Certificate (RC)";

  static var uploadPanImage = "Upload Pan Image";

  static var pleaseEnterPanCardNumber = "Please Enter Pancard Number";

  static var panNumber = "Pan Number";

  static var invalidPan = "Invalid Pan Number";

  static var isYourVehiclePermitIssued = "Is your Vehicle Permit Issued?";

  static var pleaseEnterVehiclePermitNumber =
      "Please Enter Vehicle Permit Number";

  static var issuedOn = "Issued On";

  static var issuedDateOfVehiclePermit =
      "Please Give Issued Date of Vehicle's Permit";

  static var vehiclePermitNumber = "Vehicle Permit Number";

  static var uploadVehiclePermit = "Upload Vehicle Permit";

  static var requiredSteps = "Required Steps";

  static var expiryDateOfLicense = "Please Give Expiry Date Of License";

  static var expiry = "Expiry Date";

  static var vehiclePollution = "Vehicle Pollution";

  static var chasisNumberImage = "Chasis Number Image";

  static var backSideWithNumberPlate = "Back Side With Number Plate";

  static var leftSideExterior = "Left Side Exterior";

  static var rightSideExterior = "Right Side Exterior";

  static var carInside = "Car Inside";

  static var enterChaisNumber = "Please Enter Chasis Number";

  static var chasisNumber = "Chasis Number";

  static var upload = "Upload";

  static var vehicleAuditCompleted = "Vehicle Audit Completed Successfully!";

  static var pleaseGiveYourPollutionExpiryNumber =
      "Please Give Your Pollution Expiry Date";

  static var expiryDate = "Expiry Date";

  static var uploadPollutionPaper = "Upload Pollution Paper";

  static var close = "Close";
  static var save = "Save";

  static var saveAndProcced = "Save and Proceed";
  static var tripId = "ID: ";

  static var rechargeNow = "RECHARGE NOW";
  static var callNowTxt = "Call Now";

  static var thisQuestionIsMandatory = "*This question is mandatory.";

  static var defaultPaymentMethod = "Default Payment Method";

  static var selectYourUpi = "Select Your UPI App";

  static var uploadQrCode = "Upload QR Code";

  static var enterYourUpiID = "Enter your UPI ID";

  static var upiId = "UPI ID";

  static var UpiIsValid = "Upi is valid!";

  static var UpiIsInValid = "Upi is invalid!";

  static var provideYourAlternatePaymentDetails =
      "Provide Your Alternate Payment Details";

  static var enterUpiId = "Enter UPI ID";

  static var toDashboard = "To Dashboard";

  static var applicationSubmitted = "Your Application Submitted";

  static var applicationSubmittedDescription =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

  static var enableGpsMessage =
      "Please enable your Location Service/GPS, We need this for getting your current location.";

  static var permissionRationaleMessage =
      "For driving with us we need to access your current location. Without this we can't provide any service to you, so please allow this permission.";

  static var locationDeniedForever =
      "To give your location permission, go to app settings and change current setting";

  static var appSetting = "App Setting";

  static var enableLocationMessage =
      "Please enable your GPS/Location Service, Otherwise you might not receive any bookings and cannot use our services either.";

  static const duty = "Duty";

  static const accounts = "Accounts";
  static const onlineCollect = "ONLINE COLLECTED";
  static const cashCollect = "CASH COLLECTED";
  static const amountTransfer = "AMOUNT TRANSFER BY DAY";

  static const incentives = "Incentives";

  static const partnerCare = "Partner Care";
  static const scheduleTrip = "Schedule Trips";

  static const userName = "Mukesh Janha";

  static const userProfile = "Manage Profile";

  static const schedule = "Schedule";

  static const more = "More";

  static const bookingCount = "Booking Count";

  static const operatorBill = "Operator Bill";

  static var lastUpdated = "Last Updated: ";

  static var accountSummary = "Account Summary";

  static var notification = "Notification";

  static var todaysPayments = "Today's Payment";
  static var amountTransfferedByDay = "Amount Transferred by day";
  static var paymentsSummery = "Payment Summery";
  static var referList = "Refer List";
  static var refer = "Refer";
  static var termsAndConditions = "Terms and Condition";
  static var refundPolicy = "Refund Policy";
  static var helpTxt = "Help";
  static var emergencyTxt = "Emergency Support";
  static var privacyPolicy = "Privacy Policy";
  static var tripsTxt = "Trips";

  static var currentBalanceTitle = "Balance";

  static var currentBalanceKM_TXT = "KM";
  static var referToDriver = "Refer to Driver";
  static var referToCustomer = "Refer to Customer";

  static var accountSummaryDescription =
      "Lorem Ipsum is simply dummy \n text of the printing text of the printing";
  static var toDriver = "1";
  static var terms =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";

  static var pickUp = "PICKUP";

  static var navigate = "Navigate";

  static var clientLocated = "Client Located";

  static var arrivingToCustomerIn = "Arriving To Customer In";

  static var waitingForCustomer = "Waiting for Customer";

  static var startTrip = "Start Trip";

  static var verifyOtp = "Verify OTP";

  static var yourStops = "Swipe Up to see Your Stops";

  static var endTrip = "End Trip";

  static var notAvailable = "Not Available";

  static var amountCollected = "Amount Collected";

  static var scanQrCodeToPay = "Scan QR Code to Pay";

  static var rateYourCustomer = "Rate Your Customer";

  static var saySomethingAboutYourExp = "Say something about your experience!";

  static var submit = "Submit";

  static var jaduRideDirectionNavigationServiceID =
      "jadu_ride_direction_navigation_service_id";

  static var jaduRideDirectionNavigationService =
      "JaduRide Direction Navigation Service";

  static var areYouReallyWantToLogout = "Are you really want to Logout ?";

  static var Yes = "Yes";

  static var bookAnEmergencyRide = "Book an emergency ride.";

  static var chooseHospital = "Choose Hospital";

  static var currentLocation = "Current Location";

  static var endingDestination = "Select destination";

  static var currentlyOpen = "Open";

  static var closedNow = "Closed";

  static var noHospitalsFoundNearYour = "No Hospitals Found\nNear You!";

  static var thankYou = "Thank You";

  static var youWllGetYourPaymentShortly = "You'll get your payment shortly..";

  static var totalFare = "Total Fare:";

  StringProvider._();

  static const appVersion = "AppVersion";

  //add by palash
  static const lowBalance = "Your balance is low! ";
  static const duesAreNot = "Your bookings may drop if dues are not";
  static const clearImd = "cleared immediately";
  static const submitBtn = "Submit";
  static const currentBalance = "Current Balance";
}
