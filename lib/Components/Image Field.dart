import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final URL;

  const ProfilePicture({this.URL});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children:[ 
              Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle,gradient:LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [Colors.red, Colors.blue]
                ), 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200))),
                height: 200,
                width: double.infinity,
              ),
              Container(
            height: 150.0,
            width: 150.0,
            margin: EdgeInsets.only(left: 20, right: 20, top:100),
            child: ClipOval(
                child: Image.network(
              this.URL,
              fit: BoxFit.fill,
            ))),]
      ),
    );
  }
}
