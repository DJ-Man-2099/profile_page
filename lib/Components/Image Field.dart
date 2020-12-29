import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final URL;

  const ProfilePicture({this.URL});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: 200.0,
        margin: EdgeInsets.all(20),
        child: ClipOval(
            child: Image.network(
          this.URL,
          fit: BoxFit.fill,
        )));
  }
}
