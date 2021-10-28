import 'package:flutter/material.dart';
import 'package:restapi_app/data/models/job_list.dart';

class JobButton extends StatelessWidget {
  const JobButton({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Result job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(235, 146, 190, 1)),
      child: Text(
        job.categories[0].name,
        style: const TextStyle(
            fontFamily: "Poppins", fontSize: 15, color: Colors.white),
      ),
    );
  }
}
