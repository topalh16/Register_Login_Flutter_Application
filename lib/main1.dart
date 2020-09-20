import 'package:flutter/material.dart';
import 'package:login_page/Anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_page/main.dart';


void main() {
  runApp(MyApp());
}

SharedPreferences localStorage;

TextEditingController userController = new TextEditingController();
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


class Login extends StatelessWidget {
  final _fKey = GlobalKey<FormState>();
  void _sbt() {
    final isValid = _fKey.currentState.validate();
    if (!isValid) {
      return _sbt();
    }
    _fKey.currentState.save();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.lightGreenAccent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,100,10,50),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _fKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Username"
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty){
                              return 'Enter a valid username';
                            }
                            return null;
                          },
                          controller: userController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0),)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password"
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty){
                              return 'Enter a valid password';
                            }
                            return null;
                          },
                          controller: pwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0),)
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.lightBlueAccent ,
                  child: Text('Login'),
                  onPressed: () {
                    _sbt();
                    SharedPrefs.saveUserName(userController.text);
                    SharedPrefs.savePassword(pwdController.text);
                    if (usernameController.text==userController.text && passwordController.text ==pwdController.text){
                      if (SharedPrefs.saveUserName(userController.text)!=null && SharedPrefs.savePassword(pwdController.text)!=null){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()
                        ));
                      }
                    }

                  }

                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




