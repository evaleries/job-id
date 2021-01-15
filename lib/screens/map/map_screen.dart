import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobid/screens/map/map_body.dart';
import 'package:jobid/models/job.dart';

class MapScreen extends StatelessWidget {
  static String routeName = '/map';

  final Job data;

  const MapScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MapBody(data: data),
      ),
    );
  }
}
