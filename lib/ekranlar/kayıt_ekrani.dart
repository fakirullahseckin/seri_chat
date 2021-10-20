import 'package:firebase_auth/firebase_auth.dart';
import 'package:seri_chat/screens/chat_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:seri_chat/components/yuvarlak_buton.dart';
import 'package:seri_chat/components/text_input.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "/3rdScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final fako = Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              MyTextField(
                keyboardType: TextInputType.emailAddress,
                inputType: false,
                function: (value) {
                  email = value;
                },
                text: "Enter Your Email",
              ),
              SizedBox(
                height: 8.0,
              ),
              MyTextField(
                inputType: true,
                function: (value) {
                  password = value;
                },
                text: "Enter Your Password",
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                function: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.lightBlueAccent,
                text: "Register!",
              )
            ],
          ),
        ),
      ),
    );
  }
}
