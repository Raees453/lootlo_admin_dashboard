// import 'package:flutter/material.dart';
// import 'package:lootlo_app_admin_dash/screens/forgot_password_screen.dart';
// import 'package:lootlo_app_admin_dash/screens/home_screen.dart';
// import 'package:lootlo_app_admin_dash/utils/constants.dart';
// import 'package:lootlo_app_admin_dash/widgets/custom/custome_text_field.dart';
//
// class LoginDesktopView extends StatelessWidget {
//   LoginDesktopView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.symmetric(
//         horizontal: AppConstants.screenPaddingValue * 13,
//         vertical: AppConstants.screenPaddingValue * 8,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(AppConstants.borderRadius),
//                 bottomLeft: Radius.circular(AppConstants.borderRadius),
//               ),
//               child: Image.asset(
//                 'assets/images/login_dash.jpeg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(child: buildLoginColumn(context)),
//         ],
//       ),
//     );
//   }
//
//
//
// }
