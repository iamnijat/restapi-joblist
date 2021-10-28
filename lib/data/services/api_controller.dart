import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi_app/core/constants/strings.dart';
import 'package:restapi_app/data/models/job_list.dart';

class ApiController {
  Future<JobList> getJobList() async {
    var client = http.Client();
    JobList jobList;
    try {
      var response = await client.get(Uri.parse(Strings.jobUrl));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);

        jobList = JobList.fromJson(jsonMap);
      }
    } catch (error) {
      return jobList;
    }
    return jobList;
  }
}
