class PaymentModel {
  int? statusCode;
  Result? result;

  PaymentModel({this.statusCode, this.result});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  String? tranRef;
  String? tranType;
  String? cartId;
  String? cartDescription;
  String? cartCurrency;
  String? cartAmount;
  String? tranCurrency;
  String? tranTotal;
  String? callback;
  String? returnData;
  String? redirectUrl;
  CustomerDetails? customerDetails;
  int? serviceId;
  int? profileId;
  int? merchantId;
  String? trace;

  Result(
      {this.tranRef,
      this.tranType,
      this.cartId,
      this.cartDescription,
      this.cartCurrency,
      this.cartAmount,
      this.tranCurrency,
      this.tranTotal,
      this.callback,
      this.returnData,
      this.redirectUrl,
      this.customerDetails,
      this.serviceId,
      this.profileId,
      this.merchantId,
      this.trace});

  Result.fromJson(Map<String, dynamic> json) {
    tranRef = json['tran_ref'];
    tranType = json['tran_type'];
    cartId = json['cart_id'];
    cartDescription = json['cart_description'];
    cartCurrency = json['cart_currency'];
    cartAmount = json['cart_amount'];
    tranCurrency = json['tran_currency'];
    tranTotal = json['tran_total'];
    callback = json['callback'];
    returnData = json['return'];
    redirectUrl = json['redirect_url'];
    customerDetails = json['customer_details'] != null
        ? CustomerDetails.fromJson(json['customer_details'])
        : null;
    serviceId = json['serviceId'];
    profileId = json['profileId'];
    merchantId = json['merchantId'];
    trace = json['trace'];
  }
}

class CustomerDetails {
  String? name;
  String? email;
  String? phone;
  String? street1;
  String? city;
  String? state;
  String? country;
  String? ip;

  CustomerDetails(
      {this.name,
      this.email,
      this.phone,
      this.street1,
      this.city,
      this.state,
      this.country,
      this.ip});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    street1 = json['street1'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    ip = json['ip'];
  }
}
