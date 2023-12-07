import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:halema/core/constants/constants.dart';
import 'package:halema/core/helper/functions/show_toast.dart';
import 'package:halema/core/router/router.dart';
import 'package:halema/presentation/screens/children/action/add_child.dart';
import 'package:halema/presentation/screens/children/action/child_detail.dart';
import 'package:halema/presentation/screens/children/action/delete_child.dart';
import 'package:halema/presentation/screens/children/action/get_children.dart';
import 'package:halema/presentation/screens/children/model/all_children.dart';
import 'package:halema/presentation/screens/children/model/child_detail.dart';
import 'package:halema/presentation/screens/layout/layout.dart';
import '../action/edit_child.dart';
part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(ChildrenInitial());

  AllChildrenModel? allChildrenModel;
  getchildren() async {
    emit(GetChildrenLoadingState());
    await GetChildrenAction().run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(l.message);
              emit(GetChildrenErrorState());
            },
            (r) {
              allChildrenModel = r;
              emit(GetChildrenSuccessState());
              return allChildrenModel;
            },
          ),
        );
  }

  ////////////////////////////////////////////////////////////////////////////
  addChild({
    required MultipartFile image,
    required String gender,
    required String birthdate,
    required String hopy,
    required String disease,
    required String note,
    required String name,
    required int havedisease,
  }) async {
    emit(AddChildrenLoadingState());
    await AddChildAction(
            image: image,
            gender: gender,
            birthdate: birthdate,
            hopy: hopy,
            disease: disease,
            note: note,
            name: name,
            havedisease: havedisease)
        .run()
        .then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(AddChildrenErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(AddChildrenSuccessState());
              getchildren();
              MagicRouter.pop();
            },
          ),
        );
  }

  /////////////////////////////////////////////////////////////////////////////
  editChild({
    MultipartFile? image,
    String? gender,
    String? birthdate,
    String? hopy,
    String? disease,
    String? note,
    String? name,
    int? havedisease,
    required int id,
  }) async {
    emit(EditChildrenLoadingState());
    await EditChildAction(
      image: image,
      gender: gender,
      birthdate: birthdate,
      hopy: hopy,
      disease: disease,
      note: note,
      name: name,
      havedisease: havedisease,
      id: id,
    ).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(EditChildrenErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(EditChildrenSuccessState());
              getChildDetail(id);
              getchildren();
            },
          ),
        );
  }

  ///////////////////////////////////////////////////////////////////////////
  deleteChild(int childId) async {
    emit(DeleteChildrenLoadingState());
    await DeleteChildAction(childId).run().then(
          (value) => value.fold(
            (l) {
              showToast(msg: l.message, state: ToastStates.ERROR);
              emit(DeleteChildrenErrorState());
            },
            (r) {
              showToast(msg: r!.message!, state: ToastStates.SUCCESS);
              emit(DeleteChildrenSuccessState());
              getchildren();
              MagicRouter.navigateAndPopAll(const LayoutScreen(
                index: 3,
              ));
            },
          ),
        );
  }

  //////////////////////////////////////////////////////
  List<int> childrenSeleted = [];
  List<String> childrenName = [];
  List<String> childrenImage = [];
  void selectChildren({
    required int id,
    required String name,
    required String image,
  }) {
    if (!childrenSeleted.contains(id)) {
      childrenSeleted.add(id);
      childrenName.add(name);
      childrenImage.add(image);
      emit(ChildrenSeletedSuccessState());
    } else {
      childrenSeleted.remove(id);
      childrenName.remove(name);
      childrenImage.remove(image);
      emit(ChildrenSeletedSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////
  ChildDetailModel? childDetailModel;
  getChildDetail(int childId) async {
    emit(ChildDetailLoadingState());
    await ChildDetailAction(childId).run().then(
          (value) => value.fold(
            (l) {
              if (l.statusCode == 401) {
                prefs.setBool("login", false);
              }
              debugPrint(l.message);
              emit(ChildDetailErrorState());
            },
            (r) {
              childDetailModel = r;
              emit(ChildDetailSuccessState());
              return childDetailModel;
            },
          ),
        );
  }
}
