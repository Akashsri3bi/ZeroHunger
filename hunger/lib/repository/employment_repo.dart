import 'dart:convert';
import 'dart:io';

import 'package:hunger/models/employment_details.dart';
import 'package:http/http.dart' as http;

//Selin  , Enter your credentials here where I have put mine. that is app id and app key down in BaseUrl ;
class EmploymentRepository {
  static Future<List<Result>> getJobs(String jobTitle) async {
    String Baseurl =
        'http://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=f4d924f2&app_key=f5ae6c1deeab44dce6d5e14ed2dcad6e&results_per_page=20&what=$jobTitle&content-type=application/json';
    final response = await http.get(Uri.parse(Baseurl));
    try {
      final resposeJson = jsonDecode(response.body)['results'] as List;
      //Employment employment = Employment.fromJson(resposeJson);
      List<Result> queryResults =
          resposeJson.map((result) => Result.fromJson(result)).toList();
      //for (Result result in queryResults) {
      //result = Result.fromJson(queryResults);
      //}
      return queryResults;
    } catch (e) {
      return [];
    }
  }
}
