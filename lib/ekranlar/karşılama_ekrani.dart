import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:seri_chat/kalicilar.dart';
import 'package:flutter/material.dart';
import 'giris_ekrani.dart';
import 'kayıt_ekrani.dart';
import 'package:seri_chat/components/yuvarlak_buton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "/";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: kSendButtonTextStyle.copyWith(
                      color: Colors.black, fontSize: 20),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("Flash Chat",
                          speed: Duration(milliseconds: 100)),
                      TypewriterAnimatedText("No.1 chat app on the planet!",
                          speed: Duration(milliseconds: 100)),
                    ],
                    displayFullTextOnTap: true,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: "Login!",
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: "Register!",
              function: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
