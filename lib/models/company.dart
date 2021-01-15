import 'dart:convert';
import 'package:http/http.dart' as http;

class Company {
  int id;
  dynamic location;
  dynamic industryCategories;
  String logoUrl;
  String name;
  String overview;

  Company(
      {this.id,
      this.location,
      this.logoUrl,
      this.name,
      this.overview,
      this.industryCategories});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        location: json['location'],
        industryCategories: json['industryCategories'],
        logoUrl: json['logoUrl']);
  }

  static Future<Company> show(int id) async {
    final response =
        await http.get('https://jobs2-gateway.line-apps.com/companies/$id');

    if (response.statusCode == 200) {
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to company with id:');
    }
  }

  @override
  String toString() {
    return 'Company{id: $id, name: $name, logoUrl: $logoUrl, overview: $overview, industryCategories: $industryCategories, location: $location}';
  }
}
