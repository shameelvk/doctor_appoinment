import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:samlel/components/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obsecurepass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                hintText: "Email Address",
                labelText: "Email",
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Colors.greenAccent,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.greenAccent,
              obscureText: obsecurepass,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: Colors.greenAccent,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurepass = !obsecurepass;
                        });
                      },
                      icon: obsecurepass
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black38,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Colors.greenAccent,
                            ))),
            ),
            SizedBox(
              height: 15,
            ),
            Button(
              width: double.infinity,
              title: "Sign In",
              disable: false,
              onPressed: () {
                Navigator.of(context).pushNamed("main");
              },
            )
          ],
        ));
  }
}
