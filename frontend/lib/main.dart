import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(frontend());

Future<Userdata> fetchUser() async {
  String url = "http://0.0.0.0:8080";
  final response = await http.get(Uri.parse(url));

  if (response == 200) {
    return Userdata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class Userdata {
  String name;
  int age;

  Userdata(this.name, this.age);

  factory Userdata.fromJson(Map<String, dynamic> json) {
    print(json);
    return Userdata(json['name'], json['age']);
  }
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
  late Future<Userdata> user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('frontend SnackBar'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final snackbar = SnackBar(
                content: FutureBuilder<Userdata>(
                    future: user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            'hello ${snapshot.data!.age} years old ${snapshot.data!.name}!');
                      } else if (snapshot.hasError) {
                        return Text("Error!");
                      }
                      return const CircularProgressIndicator();
                    }),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: Text('show textbar'),
          ),
        ));
  }
}
