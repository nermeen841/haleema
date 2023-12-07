class CouponModel {
  int? statusCode;
  String? messege;
  Coupon? coupon;

  CouponModel({this.statusCode, this.messege, this.coupon});

  CouponModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    messege = json['messege'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
  }
}

class Coupon {
  int? id;
  String? value;
  String? code;

  Coupon({
    this.id,
    this.value,
    this.code,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    code = json['code'];
  }
}
