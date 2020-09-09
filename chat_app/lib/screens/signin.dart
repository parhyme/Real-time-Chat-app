import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: appBarMain(context),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration("ایمیل"),
                  ),
                  TextField(
                    obscureText: true,
                    style: simpleTextFieldStyle(),
                    decoration: textFieldInputDecoration("رمز عبور"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "رمزتو فراموش کردی؟",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textDirection: TextDirection.rtl,
                        ),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007ef4),
                          const Color(0xff2675bc)
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Sign In",
                      style: btnTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007ef4),
                          const Color(0xff2675bc)
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "ورود از طریق گوگل",
                      style: btnTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "ثبت نام کن",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Text(
                        "اکانت نداری؟",
                        style: simpleTextFieldStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ])),
          ),
        ));
  }
}
