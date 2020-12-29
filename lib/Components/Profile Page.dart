import 'package:flutter/material.dart';
import 'package:profile_page/Components/Credit%20Field.dart';
import 'package:profile_page/Components/Image%20Field.dart';
import 'package:profile_page/Components/Text%20Field.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _edit = false;

  void _editData() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _edit = !_edit;
      print(_edit);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_left,size: 50,), onPressed: null),
      ),
      body: SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Center(
            child: Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Profile Image (Image in a field)
        ProfilePicture(
            URL:
                "https://pbs.twimg.com/profile_images/890905439310893056/Jfs1OJ9e_400x400.jpg"),
        //Name (Text Field)
        ProfileInfo(
          edit: _edit,
          info: "Dj Man",
          title: "Name",
        ),
        //Email (Text Field)
        ProfileInfo(
          edit: _edit,
          info: "djman2099@test.com",
          title: "Email",
        ),
        //Credit (Text Field)
        CreditField(
          info: "10",
          title: "Credit",
        ),
        //Location (Text Field)
        ProfileInfo(
          edit: _edit,
          info: "Egypt",
          title: "Location",
        ),
        //List of Products (Button)
        RaisedButton(
          onPressed: () => print("Pressed"),
          child: Text('List Products'),
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 100.0),
        )
      ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _editData,
        tooltip: _edit?'Edit':"Save",
        child: Icon(!_edit?Icons.edit:Icons.check),
        backgroundColor: !_edit?Colors.blue:Colors.green,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
