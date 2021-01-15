import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/screens/home/home_content.dart';
import 'package:jobid/screens/home/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kSpacingUnit * 3),
            HomeHeader(),
            SizedBox(height: kSpacingUnit * 3),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
