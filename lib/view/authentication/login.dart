// import 'package:expense_tracker/constatnts/colors.dart';
// import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
// import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
// import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
// import 'package:expense_tracker/constatnts/custom_widgets/login&signup/textfield.dart';
// import 'package:expense_tracker/constatnts/custom_widgets/login&signup/validators.dart';
// import 'package:expense_tracker/view/transaction/bottom_nav.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../controller/password_controller.dart';
// import '../../constatnts/custom_widgets/common/textstyle.dart';
// import '../../constatnts/custom_widgets/login&signup/bottom_text.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   final PasswordController pass = Get.put(PasswordController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.primaryColor,
//       body: Column(
//         children: [
//           const Image(
//             image: AssetImage('images/expense-logo.png'),
//             height: 250,
//             width: 500,
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: backgroundCurveDecoration(color: Appcolor.white),
//               child: FractionallySizedBox(
//                 widthFactor: 0.85,
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const BlankSpace(
//                           height: 50,
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Login to your account',
//                             style: GoogleFonts.lato(fontSize: 24),
//                           ),
//                         ),
//                         const BlankSpace(
//                           height: 30,
//                         ),
//                         Text(
//                           'Email',
//                           style: textFieldtitle(),
//                         ),

//                         const BlankSpace(
//                           height: 10,
//                         ),
//                         CustomTextField(
//                           obscure: false,
//                           validator: emailValidator,
//                           controller: emailController,
//                           title: '',
//                         ),

//                         const BlankSpace(
//                           height: 30,
//                         ),
//                         Text(
//                           'Password',
//                           style: textFieldtitle(),
//                         ),
//                         const BlankSpace(
//                           height: 10,
//                         ),
//                         Obx(
//                           () => CustomTextField(
//                             obscure: pass.visibility.value,
//                             controller: passController,
//                             validator: passwordValidator,
//                             title: 'Password',
//                             icon: IconButton(
//                               onPressed: () {
//                                 pass.changeVisibility(pass.visibility.value);
//                               },
//                               icon: Icon(pass.visibility.value
//                                   ? Icons.visibility
//                                   : Icons.visibility_off),
//                             ),
//                           ),
//                         ),

//                         const BlankSpace(
//                           height: 50,
//                         ),
//                         CustomButton(
//                           title: 'Login',
//                           onTap: () {
//                             Get.offNamed('/bottom');
//                             Get.off(const BottomNav());
//                           },
//                         ),
//                         const BlankSpace(
//                           height: 20,
//                         ),
//                         BottomText(
//                             title: "Don't have an account? ",
//                             title2: "Sign in",
//                             ontap: () {
//                               Get.offNamed('/signup');
//                             })
//                         //
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatelessWidget {
  Users({super.key});
  final AuthController cont = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return ListView.builder(
            itemBuilder: (context, index) {
              AuthModel user = controller.authBox.getAt(index);
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteUser(index: index);
                  },
                ),
              );
            },
            itemCount: controller.authBox.length,
          );
        },
      ),
    );
  }
}
