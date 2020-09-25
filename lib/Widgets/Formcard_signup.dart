import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';

class Formcard_signup extends StatefulWidget {
  _Formcard_signup createState() => _Formcard_signup();
}

class _Formcard_signup extends State<Formcard_signup> {
  String email, pass,phone;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
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
            Text("Sign Up",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Email",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Password",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Text("Phone",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextFormField(
              controller: _phoneController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(15),
            ),

            InkWell(
              onTap: signup,
              child: Container(
                  width: ScreenUtil.getInstance().setWidth(300),
                  height: ScreenUtil.getInstance().setHeight(100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF00c853), Color(0xFF6078ea)]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 4.0)
                      ]),
                  child: Center(
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Poppins-Medium",
                            color: Colors.black)),
                  ),
              ),
            ),
          ],
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
