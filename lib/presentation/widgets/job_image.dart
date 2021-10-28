import 'package:flutter/material.dart';

class JobImage extends StatelessWidget {
  const JobImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset("assets/images/certicraft.png"),
        ));
  }
}
