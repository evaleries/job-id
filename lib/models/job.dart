import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobid/models/company.dart';

class Job {
  int id;
  bool isHot;
  bool isNew;
  dynamic location;
  dynamic locations;
  num postedTimestamp;
  String source;
  String title;
  int companyId;
  Company company;
  String salaryRange;
  dynamic positions;
  dynamic experiences;
  dynamic educationLevels;
  dynamic employmentTypes;
  String detailInfo;
  String deadline;

  Job(
      {this.id,
      this.isHot,
      this.isNew,
      this.location,
      this.postedTimestamp,
      this.source,
      this.title,
      this.company,
      this.companyId,
      this.salaryRange,
      this.positions,
      this.experiences,
      this.educationLevels,
      this.employmentTypes,
      this.detailInfo,
      this.deadline});

  @override
  String toString() {
    return 'Job{company: $company, id: $id, isHot: $isHot, isNew: $isNew, location: $location, postedTimestamp: $postedTimestamp, source: $source, title: $title, salaryRange: $salaryRange, detailInfo: $detailInfo, deadline: $deadline}';
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    var location = 'locations';
    if (json.containsKey('location')) {
      location = 'location';
    }

    return Job(
        companyId: json['companyId'],
        id: json['id'],
        isHot: json['isHot'],
        isNew: json['isNew'],
        location: json[location],
        postedTimestamp: json['postedTimestamp'],
        source: json['source'],
        title: json['title'],
        salaryRange: json['salaryRange'],
        positions: json['positions'],
        experiences: json['experiences'],
        educationLevels: json['educationLevels'],
        employmentTypes: json['employmentTypes'],
        detailInfo: json['detailInfo'],
        deadline: json['deadline']);
  }

  static Future<Job> show(int id) async {
    final response =
        await http.get('https://jobs2-gateway.line-apps.com/jobs/$id');

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      Job job = Job.fromJson(json);
      job.company = await Company.show(json['companyId']);
      return job;
    } else {
      throw Exception('Failed to load job with id: $id');
    }
  }

  static Future<List<Job>> all() async {
    final response = await http.get(
        'https://jobs2-gateway.line-apps.com/jobs?page=1&size=15&isExclusive=false');

    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      List<Job> jobs = [];

      for (var item in json) {
        Job job = Job.fromJson(item);
        job.company = new Company(
            id: item['company']['id'],
            name: item['company']['name'],
            logoUrl: item['company']['logoUrl']);
        jobs.add(job);
      }
      return jobs;
    } else {
      throw Exception('Failed to load all jobs');
    }
  }
}
