import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Web',
        style: TextStyle(fontSize: 30.sp),
      ),
    );
  }
}
