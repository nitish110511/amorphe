import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';
import 'Widgets/Formcard_signup.dart';
class SignUp extends StatefulWidget {
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String email, pass, phone;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(500),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 30.0),
                  blurRadius: 25.0),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0),
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/logo.jpg',),
              Formcard_signup(),
            ],
          ),
        ),
      ),
    );
  }

  void signup() async {
    try {
      email = _usernameController.text;
      pass = _passwordController.text;
      phone = _phoneController.text;
      if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Please input an Email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      } else if (!isEmail(email)) {
        Fluttertoast.showToast(
            msg: "Not a valid Email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      } else if (pass.isEmpty) {
        Fluttertoast.showToast(
          msg: "Please input a password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Invalid Email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: pass))
          as FirebaseUser;
    } catch (e) {
      print(e.message);
    }
  }
}
