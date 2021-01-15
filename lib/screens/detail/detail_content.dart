import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/models/job.dart';
import 'package:jobid/widgets/detail_item.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Job data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
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
              SizedBox(height: kSpacingUnit * 3),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      data.company.logoUrl,
                      height: 100.sp,
                      width: 100.sp,
                    ),
                    SizedBox(height: kSpacingUnit * 2),
                    Text(
                      data.company.name,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      data.location.length > 0
                          ? '${data.location[0]['locationCategory']['ind']} - ${data.location[0]['locationSubCategory']['ind']}'
                          : 'Indonesia',
                      style: kCaptionTextStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Html(data: data.detailInfo),
              SizedBox(height: kSpacingUnit * 2),
              Text('Deadline', style: kSubTitleTextStyle),
              SizedBox(height: kSpacingUnit * 2),
              DetailItem(data: data.deadline),
              SizedBox(height: kSpacingUnit * 2),
              Text(
                'Penghasilan',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              DetailItem(data: data.salaryRange),
              SizedBox(height: kSpacingUnit * 2),
              Text(
                'Edukasi',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              if (data.educationLevels != null &&
                  data.educationLevels.length > 0)
                ...data.educationLevels
                    .map((level) => DetailItem(data: level['ind']))
                    .toList(),
              SizedBox(height: kSpacingUnit),
              Text(
                'Posisi',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              if (data.positions != null && data.positions.length > 0)
                ...data.positions
                    .map((position) => DetailItem(data: position['ind']))
                    .toList(),
              SizedBox(height: kSpacingUnit * 2),
              Text('Informasi Prusahaan', style: kSubTitleTextStyle),
              if (data.company.overview != null)
                Text(data.company.overview,
                    style: kCaptionTextStyle.copyWith(
                        color: kPrimaryTextColor, fontWeight: FontWeight.w400)),
              SizedBox(height: kSpacingUnit * 2),
              if (data.company.location['address'] != null)
                Text(
                  'Alamat: ${data.company.location['address']}',
                  style: kCaptionTextStyle.copyWith(
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              SizedBox(height: kSpacingUnit * 15),
            ],
          ),
        ),
      ),
    );
  }
}
