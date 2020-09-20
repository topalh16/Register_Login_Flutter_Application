import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main1.dart';

void main() {
  runApp(MyApp());
}

SharedPreferences localStorage;

TextEditingController nameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController usernameController = new TextEditingController();


class MyApp extends StatelessWidget {
  static Future init() async  {
    localStorage = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget  {
  final _fKey = GlobalKey<FormState>();
  void _sbt()  {
    final isValid = _fKey.currentState.validate();
    if(!isValid){
      return _sbt();
    }
    _fKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Register Page'),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _fKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Name'),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                //validator
                              },
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Enter a valid name';
                                }
                                return null;
                              },
                              controller: nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 50,
                            ),
                            Text('username'),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid username';
                                }
                                return null;
                              },
                              controller: usernameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text('Password'),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) {
                                if (value.isEmpty) {
                                  return 'Enter a valid password';
                                }
                                return null;
                              },
                              controller: passwordController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Register"
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      _sbt();
                      SharedPrefs.saveName(nameController.text);
                      SharedPrefs.savePassword(passwordController.text);
                      SharedPrefs.saveUserName(usernameController.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        }
                      ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SharedPrefs{
  static SharedPreferences _local;
  static Future<void> saveName(String name) async {
    return _local.setString('name', name);
  }
  static Future<void> saveUserName(String username) async {
    return _local.setString('usename', username);
  }
  static Future<void> savePassword(String password) async {
    return _local.setString("password", password);
  }
  static Future<void> sharedClear() async {
    return _local.clear();
  }
  static Future<void> login() async {
    return _local.setBool('login', true);
  }
}
