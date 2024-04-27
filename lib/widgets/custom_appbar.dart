import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: primarycolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(300, 20),
          bottomRight: Radius.elliptical(300, 20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            text!,
            style: TextStyle(
                fontSize: 28.sp,
                color: secondarycolor,
                fontFamily: 'NotoKufiArabic'),
          ),
        ],
      ),
    );
  }
}
