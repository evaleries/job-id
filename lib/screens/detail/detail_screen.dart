import 'package:flutter/material.dart';
import 'package:jobid/home_constants.dart';
import 'package:jobid/models/job.dart';
import 'package:jobid/screens/detail/detail_content.dart';
import 'package:jobid/screens/detail/detail_footer.dart';
import 'package:jobid/screens/detail/detail_header.dart';

class DetailScreen extends StatefulWidget {
  final Job data;

  const DetailScreen({Key key, this.data}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Job>(
        future: Job.show(widget.data.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: kSilverColor,
              body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        DetailHeader(data: snapshot.data),
                        DetailContent(data: snapshot.data),
                      ],
                    ),
                    DetailFooter(data: snapshot.data),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
