import 'package:flutter/material.dart';
import '/data/models/job_list.dart';
import 'job_button.dart';
import 'job_image.dart';
import 'job_time.dart';
import 'job_title.dart';

class JobBubble extends StatelessWidget {
  const JobBubble({
    Key key,
    @required this.job,
  }) : super(key: key);

  final Result job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(children: <Widget>[
                  const JobImage(),
                  const SizedBox(width: 15),
                  JobTitle(job: job),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              JobButton(job: job),
              JobTime(job: job),
            ],
          )
        ],
      ),
    );
  }
}
