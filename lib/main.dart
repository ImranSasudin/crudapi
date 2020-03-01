import 'package:flutter/material.dart';
import 'add_profile.dart';
import 'home.dart';

void main() => runApp(App());

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
      ),
      home: Scaffold(
        key: _scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                _scaffoldState.currentContext,
                MaterialPageRoute(builder: (BuildContext context) {
                  return FormAddScreen();
                })
            );
            // Add your onPressed code here!
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
        ),
        appBar: AppBar(
          title: Text(
            "Flutter CRUD API",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

        ),
         body: HomeScreen(),
      ),
    );
  }
}