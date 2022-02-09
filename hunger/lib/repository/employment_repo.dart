import 'dart:convert';
import 'dart:io';

import 'package:hunger/models/employment_details.dart';
import 'package:http/http.dart' as http;

//Do not works without payment
class EmploymentRepository {
  static Future<void> getJobs() async {
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    const String Baseurl = 'https://in.indeed.com/jobs?q=senior';
    final response = await http.get(Uri.parse(Baseurl), headers: headers);
    final resposeJson = jsonDecode(response.body);
    print(resposeJson);
  }
}
