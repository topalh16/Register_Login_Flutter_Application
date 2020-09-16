import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main1.dart';
void main() {
  runApp(MyApp());
}

SharedPreferences localStorage;

TextEditingController nameController = new TextEditingController();
TextEditingController usernameController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();


class MyApp extends StatelessWidget {
  static Future init() async  {
    localStorage = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center (
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name Surname",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Username",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: usernameController,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password:",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                RaisedButton(
                    child: Text('Register'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Login();
                    })
                    );
                  }
                ),
                Padding(
                  padding: EdgeInsets.only(top:40 ),
                ),
                if (localStorage!=null)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("User Logged in!!! ->  Name Surname: "
                        "${localStorage.get('Welcome')}  "
                        "Username: ${localStorage.get('username')}", style: TextStyle(fontSize: 20),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

save () async  {
  await MyApp.init();
  localStorage.setString('name_surname', nameController.text.toString());
  localStorage.setString('username', usernameController.text.toString());
  localStorage.setString('password', pwdController.text.toString());
}