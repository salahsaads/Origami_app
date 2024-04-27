import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flag/flag.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: TextFormField(
                style: const TextStyle(letterSpacing: 0.2),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'برجاء ادخال رقم هاتفك ';
                  } else if (value.length < 11) {
                    return '  برجاء ادخال رقم هاتفك بشكل صحيح';
                  }
                },
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "|",
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  const Text("+20"),
                  Flag.fromString(
                    'eg',
                    width: 30.w,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
