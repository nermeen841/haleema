class SettingModel {
  int? id;
  String? aboutEn;
  String? aboutAr;
  String? policyEn;
  String? policyAr;
  String? cancellationFees;

  SettingModel({
    this.id,
    this.aboutEn,
    this.aboutAr,
    this.policyEn,
    this.policyAr,
    this.cancellationFees,
  });

  SettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aboutEn = json['about_en'];
    aboutAr = json['about_ar'];
    policyEn = json['policy_en'];
    policyAr = json['policy_ar'];
    cancellationFees = json['cancellation_fees'];
  }
}
