// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:halema/core/constants/text_theme.dart';
import 'package:halema/presentation/screens/support/cubit/support_cubit.dart';
import 'package:halema/presentation/screens/support/model/order_setter.dart';
import '../../presentation/screens/auth/cubit/auth_cubit.dart';
import '../../presentation/screens/auth/model/country.dart';
import '../constants/colors.dart';

class CountryDropDownSelection extends StatefulWidget {
  static String? selectedCountry;
  const CountryDropDownSelection(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List<String>? items;
  final String? text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CountryDropDownSelectionState createState() =>
      _CountryDropDownSelectionState();
}

class _CountryDropDownSelectionState extends State<CountryDropDownSelection> {
  Contries? _chosenValue;

  @override
  void initState() {
    CountryDropDownSelection.selectedCountry = null;
    GetIt.I<AuthCubit>().getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      bloc: GetIt.I<AuthCubit>(),
      builder: (context, state) {
        return (GetIt.I<AuthCubit>().countryModel != null)
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: widget.borderColor ?? Colors.transparent),
                  color: widget.fillColor ?? textFormFieldColor,
                ),
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: colorGrey,
                    size: 30,
                  ),
                  iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: _chosenValue,
                  items: GetIt.I<AuthCubit>()
                      .countryModel!
                      .contries!
                      .map<DropdownMenuItem<Contries>>((Contries? value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value!.code!,
                        style:
                            bodyStryle(color: colorLightGrey, context: context),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    (widget.text != null && widget.text != "")
                        ? widget.text!
                        : GetIt.I<AuthCubit>().countryCode ?? "",
                    style: bodyStryle(color: colorLightGrey, context: context),
                  ),
                  onChanged: (Contries? value) {
                    setState(() {
                      _chosenValue = value;
                      CountryDropDownSelection.selectedCountry = value!.code!;
                    });
                    _chosenValue = value;
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
class NationalityDropDown extends StatefulWidget {
  static String? selectedNationality;

  const NationalityDropDown(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _NationalityDropDownState createState() => _NationalityDropDownState();
}

class _NationalityDropDownState extends State<NationalityDropDown> {
  Contries? _chosenValue;

  @override
  void initState() {
    NationalityDropDown.selectedNationality = null;
    GetIt.I<AuthCubit>().getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      bloc: GetIt.I<AuthCubit>(),
      builder: (context, state) {
        return (GetIt.I<AuthCubit>().countryModel != null)
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: widget.borderColor ?? Colors.transparent),
                  color: widget.fillColor ?? textFormFieldColor,
                ),
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: colorGrey,
                    size: 30,
                  ),
                  iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: _chosenValue,
                  items: GetIt.I<AuthCubit>()
                      .countryModel!
                      .contries!
                      .map<DropdownMenuItem<Contries>>((Contries? value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value!.nationality!,
                        style:
                            bodyStryle(color: colorLightGrey, context: context),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    (widget.text != "")
                        ? widget.text
                        : GetIt.I<AuthCubit>().nationality ?? "",
                    style: bodyStryle(color: colorLightGrey, context: context),
                  ),
                  onChanged: (Contries? value) {
                    setState(() {
                      _chosenValue = value;
                      NationalityDropDown.selectedNationality =
                          value!.nationality!;
                    });
                    _chosenValue = value;
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////

class CustomDropDown extends StatefulWidget {
  static String? selectedTime;
  const CustomDropDown(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator,
      this.iconImage,
      this.imageColor})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final String? iconImage;
  final Color? borderColor;
  final Color? imageColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: widget.borderColor ?? Colors.transparent),
        color: widget.fillColor ?? textFormFieldColor,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: colorGrey,
          size: 25,
        ),
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: bodyStryle(color: colorGrey, context: context),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: bodyStryle(color: colorLightGrey, context: context),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
            CustomDropDown.selectedTime = value;
          });
          _chosenValue = value;
        },
        onSaved: widget.onSave,
        validator: widget.validator,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class OrderSetterSelection extends StatefulWidget {
  static int? selectedSetter;
  const OrderSetterSelection(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _OrderSetterSelectionState createState() => _OrderSetterSelectionState();
}

class _OrderSetterSelectionState extends State<OrderSetterSelection> {
  OrderSetters? _chosenValue;

  @override
  void initState() {
    OrderSetterSelection.selectedSetter = null;
    GetIt.I<SupportCubit>().getOrderSetters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupportCubit, SupportState>(
      listener: (context, state) {},
      bloc: GetIt.I<SupportCubit>(),
      builder: (context, state) {
        return (GetIt.I<SupportCubit>().orderSetterModel != null)
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: widget.borderColor ?? Colors.transparent),
                  color: widget.fillColor ?? textFormFieldColor,
                ),
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: colorGrey,
                    size: 30,
                  ),
                  iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: _chosenValue,
                  items: GetIt.I<SupportCubit>()
                      .orderSetterModel!
                      .setters!
                      .map<DropdownMenuItem<OrderSetters>>(
                          (OrderSetters? value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value!.user!.name!,
                        style:
                            bodyStryle(color: colorLightGrey, context: context),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    widget.text,
                    style: bodyStryle(color: colorLightGrey, context: context),
                  ),
                  onChanged: (OrderSetters? value) {
                    setState(() {
                      _chosenValue = value;
                      OrderSetterSelection.selectedSetter = value!.id!;
                    });
                    _chosenValue = value;
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////
class CustomHourSelectionDropDown extends StatefulWidget {
  static String? selectedTime;
  const CustomHourSelectionDropDown(
      {Key? key,
      this.items,
      this.text = '',
      this.fillColor = Colors.white,
      this.onSave,
      this.borderColor,
      this.validator,
      this.iconImage,
      this.imageColor})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final String? iconImage;
  final Color? borderColor;
  final Color? imageColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomHourSelectionDropDownState createState() =>
      _CustomHourSelectionDropDownState();
}

class _CustomHourSelectionDropDownState
    extends State<CustomHourSelectionDropDown> {
  String? _chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: widget.borderColor ?? Colors.transparent),
        color: widget.fillColor ?? textFormFieldColor,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: colorGrey,
          size: 25,
        ),
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: bodyStryle(color: colorGrey, context: context),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style: bodyStryle(color: colorLightGrey, context: context),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
            CustomHourSelectionDropDown.selectedTime = value;
          });
          _chosenValue = value;
        },
        onSaved: widget.onSave,
        validator: widget.validator,
      ),
    );
  }
}
