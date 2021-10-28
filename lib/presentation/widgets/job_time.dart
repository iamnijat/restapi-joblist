
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restapi_app/data/models/job_list.dart';

class JobTime extends StatelessWidget {
  const JobTime({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Result job;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd MMM - HH:mm').format(job.publicationDate),
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 14,
        fontFamily: "Poppins",
      ),
    );
  }
}
