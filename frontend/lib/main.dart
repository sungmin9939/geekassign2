import 'package:flutter/material.dart';

void main() => runApp(frontend());


class Userdata{
  String name;
  int age;

  Userdata(this.name, this.age);
}



class frontend extends StatelessWidget {
  const frontend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      home: SnackBarApp(),
    );
  }
}

class SnackBarApp extends StatefulWidget {
  const SnackBarApp({Key? key}) : super(key: key);

  @override
  _SnackBarAppState createState() => _SnackBarAppState();
}

class _SnackBarAppState extends State<SnackBarApp> {

  Userdata user = Userdata('sungmin', 23);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('frontend SnackBar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            final snackbar = SnackBar(
              content: Text('hello ${user.age} years old ${user.name}'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: (){},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text('show textbar'),
        ),
      )
    );
  }
}

