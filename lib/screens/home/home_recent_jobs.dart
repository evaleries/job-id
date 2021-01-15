import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/widgets/job_card.dart';
import 'package:jobid/models/job.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeRecentJobs extends StatefulWidget {
  const HomeRecentJobs({
    Key key,
  }) : super(key: key);

  @override
  _HomeRecentJobsState createState() => _HomeRecentJobsState();
}

class _HomeRecentJobsState extends State<HomeRecentJobs> {
  List<Job> jobs;

  Future<String> loadJsonAsset(String fileName) async {
    return await rootBundle.loadString('assets/data/' + fileName);
  }

  Future<dynamic> loadEducation() async {
    return this.loadJsonAsset('education.json').then((val) => jsonDecode(val));
  }

  Future<dynamic> loadJobs() async {
    return this.loadJsonAsset('job.json').then((val) => jsonDecode(val));
  }

  Future<dynamic> loadLocations() async {
    return this.loadJsonAsset('location.json').then((val) => jsonDecode(val));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: Job.all(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: snapshot.data.asMap().entries.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3)
                      .copyWith(
                    top: item.key == 0 ? kSpacingUnit * 2 : 0,
                    bottom: kSpacingUnit * 2,
                  ),
                  child: JobCard(data: item.value),
                );
              }).toList(),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
