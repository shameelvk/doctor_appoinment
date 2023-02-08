import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:samlel/components/Social_Button.dart';
import 'package:samlel/components/login_form.dart';
import 'package:samlel/components/signup_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIN = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              isSignIN
                  ? "Sign in to your account"
                  : 'You can easily sign up,and connect to the Doctors nearby you',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            isSignIN ? LoginForm() : SignUpForm(),
            SizedBox(
              height: 15,
            ),
            isSignIN
                ? Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Your Password?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  )
                : Container(),
            const Spacer(),
            Center(
              child: Text(
                "Or continue with social account",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SocialButton(social: 'google'),
                SocialButton(social: 'facebook'),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isSignIN
                      ? "Don't have an account?"
                      : 'Already have an account?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 12,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isSignIN = !isSignIN;
                    });
                  },
                  child: Text(
                    isSignIN ? "Sign Up" : "Sign In",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
