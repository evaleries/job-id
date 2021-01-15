import 'package:flutter/material.dart';
import 'package:jobid/home_constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 3,
      ),
      child: Center(child: Text('JOB.ID', style: kHeadingTextStyle.copyWith(fontWeight: FontWeight.w600))),
    );
  }
}
