import 'package:chat_app/screens/chatsfeed.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  Auth auth = new Auth();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameTextEcontroller = new TextEditingController();
  TextEditingController emailTextEcontroller = new TextEditingController();
  TextEditingController passwordTextEcontroller = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      auth
          .signUpWithEmailAndPassword(
              emailTextEcontroller.text, passwordTextEcontroller.text)
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatFeed())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: appBarMain(context),
        body: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) {
                                  return val.isEmpty || val.length < 2
                                      ? "لطفا نام کاربری را وارد کنید"
                                      : null;
                                },
                                controller: nameTextEcontroller,
                                style: simpleTextFieldStyle(),
                                decoration:
                                    textFieldInputDecoration("نام کاربری"),
                              ),
                              TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-      zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "ایمیل صحیح وارد کنید";
                                },
                                controller: emailTextEcontroller,
                                style: simpleTextFieldStyle(),
                                decoration: textFieldInputDecoration("ایمیل"),
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  return val.length > 6
                                      ? null
                                      : "رمز عبور باید بیشتر از 6 کاراکتر باشد";
                                },
                                controller: passwordTextEcontroller,
                                style: simpleTextFieldStyle(),
                                decoration:
                                    textFieldInputDecoration("رمز ورود"),
                              ),
                            ],
                          ),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                textDirection: TextDirection.rtl,
                              ),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            signMeUp();
                          },
                          child: Container(
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
                              "ثبت نام",
                              style: btnTextStyle(),
                            ),
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
                                  "وارد شو",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                            Text(
                              "اکانت داری؟",
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
