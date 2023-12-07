import 'package:halema/presentation/screens/home/model/get_setters_model.dart';

class FilterSetterModel {
  int? id;
  String? hourPrice;
  String? hint;
  String? professionalLife;
  int? completedOrders;
  int? receiveOrder;
  int? isCareerComplete;
  int? isFacilityComplete;
  User? user;

  FilterSetterModel(
      {this.id,
      this.hourPrice,
      this.hint,
      this.professionalLife,
      this.completedOrders,
      this.receiveOrder,
      this.isCareerComplete,
      this.isFacilityComplete,
      this.user});

  FilterSetterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourPrice = json['hour_price'];
    hint = json['hint'];
    professionalLife = json['Professional_life'];
    completedOrders = json['completed_orders'];
    receiveOrder = json['receive_order'];
    isCareerComplete = json['is_career_complete'];
    isFacilityComplete = json['is_facility_complete'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
