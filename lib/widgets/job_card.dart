import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/models/job.dart';
import 'package:jobid/screens/detail/detail_screen.dart';

class JobCard extends StatelessWidget {
  final Job data;

  const JobCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          return DetailScreen(data: data);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 125.w,
            padding: EdgeInsets.fromLTRB(20, 10, 15, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      data.company.logoUrl,
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Flexible(
                        child: Text(
                      data.company.name,
                      style: kCardTitleTextStyle,
                    )),
                    // const Spacer(),
                    // SvgPicture.asset(
                    //   'assets/icons/map.svg',
                    //   height: 20.sp,
                    //   width: 20.sp,
                    // ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.title,
                  style: kSubTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                    '${data.location['locationSubCategory']['ind']} - ${data.location['locationCategory']['ind']}',
                    style: kCaptionTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w200)),
              ],
            ),
          );
        },
      ),
    );
  }
}
