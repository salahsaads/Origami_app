// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:origami/screens/register_screen.dart';

import '../Theme/colors.dart';

import '../bussinus_logic/authentication_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  bool isloading = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppbar(
              text: "مرحبا بك",
            ),
            SizedBox(
              height: 50.h,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 100.w,
            ),
            Form(
                key: formstate,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'رقم الهاتف',
                        hint: 'Example@gmail.com',
                        icon: Icons.phone,
                        controller: _phoneNumberController,
                        obscure: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        obscure: true,
                        label: 'الباسورد',
                        hint: 'ادخل كلمه المرور',
                        icon: Icons.lock,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButton(
                        ontap: () async {
                          if (formstate.currentState!.validate()) {
                            isloading = true;
                            setState(() {});

                            // await BlocProvider.of<AuthenticationCubit>(context)
                            login(
                                phone: _phoneNumberController,
                                pass: _passwordController,
                                context: context);
                            isloading = false;
                            setState(() {});
                          }
                        },
                        text: isloading ? '...' : 'تسجيل الدخول ',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ));
                              },
                              child: const Text(
                                "إنشاء حساب جديد",
                                style: TextStyle(
                                    color: primarycolor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              )),
                          const Text(
                            "! ليس لديك حساب ",
                            style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
