import 'package:flutter/material.dart';
import 'package:login_page/Anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_page/main.dart';

void main() {
  runApp(MyApp());
}

SharedPreferences localStorage;

TextEditingController usernameController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();



class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Center(
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
                        "Username:",
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
                              filled: true))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password :",
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
                              filled: true))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                if (localStorage != null)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("User Logged in!!! ->  Username: ${localStorage.get('username')}  Password: ${localStorage.get('password')}",style: TextStyle(fontSize: 20),),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


save() async {
  await MyApp.init();
  localStorage.setString('email', usernameController.text.toString());
  localStorage.setString('password', pwdController.text.toString());

}





