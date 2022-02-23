import 'dart:convert';

import 'package:hunger/models/employment_details.dart';
import 'package:http/http.dart' as http;

//Selin  , Enter your credentials here where I have put mine. that is app id and app key down in BaseUrl ;
// I changed the credentials with mine, they are new now
class EmploymentRepository {
  static Future<List<Result>> getJobs(String jobTitle) async {
    String Baseurl =
        'http://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=8f55b34f&app_key=db42e5a4d6af37c8d1edd36768ccb306&results_per_page=20&what=$jobTitle&content-type=application/json';
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

  static Future<List<Result>> getFilteredJobs(String jobTitle, String salarymin,
      String sort_by, bool fulltime, bool permanant) async {
    String filterUrl =
        "http://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=f4d924f2&app_key=f5ae6c1deeab44dce6d5e14ed2dcad6e&results_per_page=20&what=$jobTitle&content-type=application/json";
    if (salarymin == 'any' &&
        sort_by == 'any' &&
        fulltime == false &&
        permanant == false) {
      filterUrl =
          'http://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=f4d924f2&app_key=f5ae6c1deeab44dce6d5e14ed2dcad6e&results_per_page=20&what=$jobTitle&content-type=application/json';
    } else if (sort_by == 'any' && salarymin != 'any') {
      filterUrl =
          'http://api.adzuna.com:80/v1/api/jobs/gb/search/1?app_id=f4d924f2&app_key=f5ae6c1deeab44dce6d5e14ed2dcad6e&results_per_page=20&what=$jobTitle&salary_min=$salarymin&full_time=1&permanent=1&content-type=application/json';
    } else if (salarymin == 'any' && sort_by != 'any') {
      filterUrl =
          'http://api.adzuna.com:80/v1/api/jobs/gb/search/1?app_id=f4d924f2&app_key=f5ae6c1deeab44dce6d5e14ed2dcad6e&results_per_page=20&what=$jobTitle&sort_by=$sort_by&full_time=1&permanent=1&content-type=application/json';
    }
    final response = await http.get(Uri.parse(filterUrl));
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
