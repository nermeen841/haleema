// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:zat/core/utiles/size_config.dart';
// import 'package:zat/presentation/screens/messages/cubit/chat_cubit.dart';
// import 'dart:math' as math;
// import '../../../../core/constants/colors.dart';

// class CustomTextFieldWithButtonChat extends StatefulWidget {
//   final int recieverId;
//   const CustomTextFieldWithButtonChat({Key? key, required this.recieverId})
//       : super(key: key);

//   @override
//   State<CustomTextFieldWithButtonChat> createState() =>
//       _CustomTextFieldWithButtonChatState();
// }

// class _CustomTextFieldWithButtonChatState
//     extends State<CustomTextFieldWithButtonChat> {
//   TextEditingController message = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: kMainColor, width: 2),
//             color: Colors.white,
//           ),
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   minLines: 1,
//                   maxLines: 5,
//                   controller: message,
//                   onChanged: (value) {},
//                   decoration: const InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                     border: InputBorder.none,
//                     hintText: 'Enter your message',
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   BlocConsumer<ChatCubit, ChatState>(
//                     listener: (context, state) {
//                       if (state is SendMessageSuccessState) {
//                         message.clear();
//                       }
//                     },
//                     bloc: GetIt.I<ChatCubit>(),
//                     builder: (context, state) {
//                       return Container(
//                         color: Colors.transparent,
//                         child: MaterialButton(
//                           onPressed: () => GetIt.I<ChatCubit>().sendMessage(
//                               recieverId: widget.recieverId,
//                               message: message.text),
//                           minWidth: 1,
//                           child: SizedBox(
//                             height: SizeConfig.defaultSize! * 3.5,
//                             child: Transform(
//                                 alignment: Alignment.center,
//                                 transform: Matrix4.rotationY(math.pi),
//                                 child: Icon(
//                                   Icons.send,
//                                   color: kMainColor,
//                                 )),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
