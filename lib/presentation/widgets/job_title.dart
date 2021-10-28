
import 'package:flutter/material.dart';
import 'package:restapi_app/data/models/job_list.dart';

class JobTitle extends StatelessWidget {
  const JobTitle({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Result job;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(job.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.4,
                    height: 1.5,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway")),
            const SizedBox(
              height: 5,
            ),
            Text(job.locations[0].name,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15.7,
                    color: Colors.grey[700])),
          ]),
    );
  }
}