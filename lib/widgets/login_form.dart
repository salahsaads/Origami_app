// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:origami/Theme/colors.dart';
// import 'package:origami/screens/home_screen.dart';
// import 'package:origami/screens/register_screen.dart';
// import 'package:origami/widgets/custom_button.dart';
// import 'package:origami/widgets/custom_textfield.dart';

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final GlobalKey<FormState> formstate = GlobalKey();

//   TextEditingController email = TextEditingController();

//   TextEditingController pass = TextEditingController();
//   bool isloading = false;
//   @override
//   void dispose() {
//     super.dispose();
//     email.dispose();
//     pass.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: formstate,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               CustomTextField(
//                 label: 'الإيميل',
//                 hint: 'Example@gmail.com',
//                 icon: Icons.email_outlined,
//                 controller: email,
//                 obscure: false,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomTextField(
//                 obscure: true,
//                 label: 'الباسورد',
//                 hint: 'ادخل كلمه المرور',
//                 icon: Icons.lock,
//                 controller: pass,
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               CustomButton(
//                 ontap: () async {
//                   if (formstate.currentState!.validate()) {
//                     try {
//                       isloading = true;
//                       setState(() {});
//                       await FirebaseAuth.instance.signInWithEmailAndPassword(
//                         email: email.text.trim(),
//                         password: pass.text.trim(),
//                       );

//                       // ignore: use_build_context_synchronously
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                           ),
//                           (route) => false);
//                     } on FirebaseAuthException catch (e) {
//                       if (e.message ==
//                           "The supplied auth credential is incorrect, malformed or has expired.") {
//                         return AwesomeDialog(
//                           context: context,
//                           dialogType: DialogType.error,
//                           animType: AnimType.rightSlide,
//                           title: 'خطأ بالإيميل او الباسورد',
//                           desc:
//                               ' بالرجاء التأكد من صحه البيانات المدخله واعاده المحاوله ',
//                           btnOkOnPress: () {},
//                         ).show();
//                       }
//                     }
//                     isloading = false;
//                     setState(() {});
//                   }
//                 },
//                 text: isloading ? '...' : 'تسجيل الدخول ',
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => RegisterScreen(),
//                             ));
//                       },
//                       child: const Text(
//                         "إنشاء حساب جديد",
//                         style: TextStyle(
//                             color: primarycolor,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline),
//                       )),
//                   const Text(
//                     "! ليس لديك حساب ",
//                     style: TextStyle(
//                       fontFamily: 'NotoKufiArabic',
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
