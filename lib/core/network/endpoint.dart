// ignore_for_file: non_constant_identifier_names

class EndPoint {
  //Auth endpoints
  static String LOGIN = "/auth/login";
  static String REGISTER = "/auth_parent/register";
  static String VerifyCode = "/auth/verifyCode";
  static String logout = "/auth/logout";
  static String DeleteAccount = "/auth/deleteAccount";
  static String country = "/getcontries";
  static String resendCode = "/auth/resendVerificationCode";

  // Profile endpoints
  static String getProfile = "/profile/profileDetails";
  static String updateProfile = "/parent_profile/update_profile";

  //chat endpoints
  static String getconversation = "/chat/get_my_conversations";
  static String conversationMessage = "/chat/conversation_messeges";
  static String deleteChat = "/chat/delete";
  static String sendMessage = "/chat/send_message";

  //setters endpoints
  static String getSetters = "/parent/get_setters";
  static String getSettersDetails = "/parent/setter_details";
  static String getReview = "/reviews_details";
  static String addRate = "/add_rate";
  static String filterSetter = "/parent/filter_setters";

  // children endpoints
  static String getChildren = "/children/my_childrens";
  static String addChildren = "/children/add_children";
  static String editChildren = "/children/edit_children";
  static String deleteChildren = "/children/delete_children/";
  static String childDetail = "/dashboard/childrens/show/";

  // driver endpoints
  static String getdriver = "/driver/my_drivers";
  static String adddriver = "/driver/add_driver";
  static String editdriver = "/driver/edit_driver";
  static String deletedriver = "/driver/delete_driver/";
  static String driverDetail = "/dashboard/drivers/show/";

  // orders endpoint
  static String makeOrder = "/parent/make_order";
  static String getOrder = "/order/get_orders";
  static String cancelOrder = "/parent/cancel_order";
  static String orderDetail = "/order/order_details";
  static String discount = "/coupons/add_coupon";
  static String payment = "/payment/Payment_Checkout/";

  // favourite endpoints
  static String getfavourite = "/parent/get_my_favourites";
  static String addtofavourite = "/parent/make_favourite";
  static String removefromfavourite = "/parent/delete_favourite";

  // support endpoint
  static String makeAticket = "/parent/report/make_ticket";
  static String makeAticketThread = "/parent/report/make_ticket_thread";
  static String myTicketsWithThreads = "/parent/report/my_tickets_with_threads";
  static String myOrdersSetters = "/parent/my_orders_setters";
  static String threadMessages = "/parent/report/ticket_threads";

  // notification
  static String notification = "/notifications/get_my_notifications?page=1";

  // wallet endpoint
  static String latestTransaction = "/wallet/latest_transactions";
  static String AllTransaction = "/wallet/transactions";
  static String totalAmount = "/wallet/total_amount";

  // change phone number
  static String sendVerificationCode =
      "/verification_code/send_verification_code";
  static String updatePhone = "/update_phone/update_phone_verifyCode";
  static String deleteAccount = "/delete_account";
}
