import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:DocTime/components/button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
              controller: _nameController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                hintText: "Username",
                labelText: "Username",
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.person_outline),
                prefixIconColor: Colors.greenAccent,
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
              title: "Sign Up",
              disable: false,
              onPressed: () {
                Navigator.of(context).pushNamed("main");
              },
            )
          ],
        ));
  }
}
