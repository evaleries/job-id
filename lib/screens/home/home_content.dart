import 'package:flutter/material.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/screens/home/home_recent_jobs.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: kSilverColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Text(
                  'Daftar Pekerjaan',
                  style: kSubTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              HomeRecentJobs(),
            ],
          ),
        ),
      ),
    );
  }
}
