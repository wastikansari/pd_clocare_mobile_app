class AppConstants {
  static const String APP_NAME = "Clocare";
  static const int APP_VERSION = 1;
  static const String MAP_API_KEY = 'AIzaSyDutH2pi37uW2FKyzD06s-myx4nlyCyCMc';

  static String TOKEN = 'token';

  // static const String BASE_URL = "https://cc.vcantech.biz";       // Production url
  static const String BASE_URL = "https://cc.vcantech.ca";          // Development url
  static const String HEADER_TOKEN = 'Bearer 466fdac7291ffb284856e6a25a15cbad';

  //auth end points
  static const String LOGIN_URL = '/pdapi/v1/staff/login';
  static const String REGISTRATION_URL = '/pdapi/v1/staff/register';
  static const String NUMBER_CHECK_URL = '/pdapi/v1/staff/check-mobile';
  static const String RESEND_OTP_URL = '/pdapi/v1/staff/resendotp';

  // staff end points
  static const String STAFF_PROFILE_URL = '/pdapi/v1/staff/profile';
  static const String STAFF_PASSWORD_UPDATE = '/pdapi/v1/staff/profile-password-update';
  static const String STAFF_PER_ORDER_EARNING = '/pdapi/v1/staff/deliver-data';

  static const String DELIVER_URL = '/pdapi/v1/delivery/list';
  static const String NEW_DELIVERIE_ORDER_LIST_URL = '/pdapi/v1/orders/orderlist';
  // static const String NEW_PICKUP_ORDER_LIST_URL = '/pdapi/v1/orders/orderlist';
  static const String DELIVERY_STARTED_URL = '/pdapi/v1/delivery/delivery-started';
  static const String DELIVERY_DONE_URL = '/pdapi/v1/delivery/delivered';
  static const String PICKUP_START_URL = '/pdapi/v1/pickup/pickup-started';
  static const String PICKUP_DONE_URL = '/pdapi/v1/pickup/picked-up';
  static const String QUICK_PICKUP_URL = '/pdapi/v1/pickup/quick-picked-up';


  static const String PICKUP_URL = '/pdapi/v1/pickup/list';
  static const String ORDER_DETAIL_URL = '/pdapi/v1/orders/orderdetail';

  static const String VENDOR_URL = '/pdapi/v1/general/vendors';
  static const String PINCODE_URL = '/pdapi/v1/pincodes/bystatecity/9';   // 9 is stateId by default Gujrat
  static const String GARMENT_URL = '/pdapi/v1/price-list/forallservicesnew';

  // customer end  points
  static const String CREATE_NEW_CUSTOMER_URL = '/pdapi/v1/general/issue-new-card';
  static const String CUSTOMER_MOBILE_NUMBER_CHECK_URL ='/api/v1/customers/check-mobile';
  static const String CUSTOMER_RESEND_OTP_URL = '/api/v1/customers/resendotpnew';
  static const String CUSTOMER_INFO_URL = '/pdapi/v1/general/customer-info';
  static const String CUSTOMER_ADDRESS_CREATE_URL = '/api/v1/customers/createaddress';
  static const String CUSTOMER_ADDRESS_UPDATE_URL = '/api/v1/customers/updateaddress';
  static const String CUSTOMER_ADDRESS_DELETE_URL = '/api/v1/customers/deleteaddress';

  static const String CUSTOMER_BALANCE_CHECK_URL = '/pdapi/v1/general/customer-balance';
  static const String COLLECT_CASH_URL = '/pdapi/v1/pickup/collect-cash';
    static const String ORDER_PROCESSING_PAYMENT_URL = '/pdapi/v1/orders/processing-payment';
  
  // not able to deliver
  static const String ORDER_ATTEMPT_REASONS_URL = '/pdapi/v1/orders/orderinfo';
  static const String ORDER_DELIVERY_ATTEMPT_URL = '/pdapi/v1/orders/delivery-attempted';
  static const String ORDER_PICKUP_ATTEMPT_URL = '/pdapi/v1/orders/pickup-attempted';

  // take order
  static const String SERVICE_TYPE_URL = '/pdapi/v1/general/ordertypes';

  static const String TIME_SLOT_URL = '/pdapi/v1/general/getinitialdatetime';
  
}
