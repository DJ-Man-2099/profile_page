import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  final title, info, edit;

  ProfileInfo({this.title, this.info, this.edit});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final TextEditingController data = TextEditingController();

  @override
  void initState() {
    super.initState();
    data.text = this.widget.info;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: TextField(
        controller: data,
        readOnly: !this.widget.edit,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            labelText: this.widget.title,
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue, style: BorderStyle.solid))),
      ),
    );
  }
}
