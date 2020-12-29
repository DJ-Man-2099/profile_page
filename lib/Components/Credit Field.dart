import 'package:flutter/material.dart';

class CreditField extends StatefulWidget {
  final title, info, isEdit;

  const CreditField({this.title, this.info, this.isEdit});

  @override
  _CreditFieldState createState() => _CreditFieldState();
}

class _CreditFieldState extends State<CreditField> {
  var value;

  @override
  void initState() {
    super.initState();
    value = widget.info;
  }

  void _addCredit({context}) {
    var data = value;
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
                  value = data.toString();
                  print(value);
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
            })).then((_) => setState(() {}));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: Row(
        children: [
          Credit(value: value),
          widget.isEdit
              ? (Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _addCredit(context: context);
                      });
                    },
                    child: Text("Add Credit"),
                  ),
                ))
              : Container()
        ],
      ),
    );
  }
}

class Credit extends StatelessWidget {
  Credit({
    Key key,
    @required this.value,
  }) : super(key: key);

  var value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
            decoration: BoxDecoration(
          border: Border.fromBorderSide(
               BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: Colors.blue,
      ))),
      padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Icon(Icons.monetization_on,color: Colors.blue,),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ],
            )),
      ),
    );
  }
}
