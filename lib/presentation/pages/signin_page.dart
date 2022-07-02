import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
            return Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: InkWell()
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'AppName',
                            style: TextStyle(
                                color: Color(0xFFeb5e28),
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const TextField(
                          // controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: const TextField(
                          obscureText: true,
                          //controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFeb5e28)),),
                            child: const Text('Sign in'),
                            onPressed: () {

                            },
                          )),
                      TextButton(
                        child: const Text(
                          'log in',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFeb5e28),
                          ),
                        ),
                        onPressed: () {
                          Modular.to.navigate("/login_page");
                        },
                      )
                    ],
                  )),
            );
  }
}
