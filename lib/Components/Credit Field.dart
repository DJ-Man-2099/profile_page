import 'package:flutter/material.dart';

class CreditField extends StatefulWidget {
  final title, info;

  const CreditField({this.title, this.info});

  @override
  _CreditFieldState createState() => _CreditFieldState();
}

class _CreditFieldState extends State<CreditField> {
  final TextEditingController info = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.info.text = this.widget.info;
  }

  void _addCredit({context, data}) {
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
              void add() {
                setState(() {
                  data = (num.parse(data) + 1).toString();
                });
              }

              void subtract() {
                setState(() {
                  data = (num.parse(data) - 1).toString();
                });
              }

              void close() {
                Navigator.pop(context);
              }

              void save(data) {
                setState(() {
                  info.text = data.toString();
                });
                close();
              }

              return AlertDialog(
                title: Text("Change Credit"),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: subtract, child: Icon(Icons.remove)),
                    Container(
                      child: Text(data),
                    ),
                    FlatButton(onPressed: add, child: Icon(Icons.add)),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: close,
                      child: Text(
                        'Discard',
                        style: TextStyle(color: Colors.red),
                      )),
                  FlatButton(onPressed: () => save(data), child: Text('Save')),
                ],
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: info,
              readOnly: true,
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  labelText: this.widget.title,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: RaisedButton(
              onPressed: () => _addCredit(context: context, data: info.text),
              child: Text("Add Credit"),
            ),
          )
        ],
      ),
    );
  }
}
