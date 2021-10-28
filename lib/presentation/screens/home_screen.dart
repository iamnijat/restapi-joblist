import 'package:flutter/material.dart';
import 'package:restapi_app/data/models/job_list.dart';
import 'package:restapi_app/data/services/api_controller.dart';
import 'package:restapi_app/presentation/widgets/job_bubble.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<JobList> _jobList;
  bool isFavorite = true;
  @override
  void initState() {
    _jobList = ApiController().getJobList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<JobList>(
        future: _jobList,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.pinkAccent,
            ));
          }
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  var job = snapshot.data.results[index];
                  return JobBubble(job: job);
                });
          }
        },
      ),
    );
  }
}
