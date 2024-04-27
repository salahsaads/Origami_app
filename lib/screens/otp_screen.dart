import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:origami/Theme/colors.dart';
import 'package:origami/widgets/custom_appbar.dart';
import 'package:origami/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppbar(
              text: '',
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "تحقق من رقم الهاتف ",
              style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: 'NotoKufiArabic',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'لقد ارسلنا رمزًا مكوناً من أربعه أرقام الي ',
              style: TextStyle(fontSize: 18.sp),
            ),
            const Text("phonenumber"),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: PinCodeTextField(
                cursorColor: Colors.black,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  fieldWidth: 70.w,
                  inactiveFillColor: secondarycolor,
                  inactiveBorderWidth: 0,
                  inactiveColor: secondarycolor,
                  selectedFillColor: Colors.white,
                  selectedColor: primarycolor,
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 50,
                  activeFillColor: Colors.white,
                ),
                animationDuration: const Duration(
                  milliseconds: 300,
                ),
                enableActiveFill: true,
                // errorAnimationController: errorController,
                // controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },

                appContext: context,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomButton(text: 'ارسال'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('اعد الارسال ',
                        style: TextStyle(
                            color: primarycolor,
                            decoration: TextDecoration.underline))),
                const Text(
                  'لم يصلك رمز ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
