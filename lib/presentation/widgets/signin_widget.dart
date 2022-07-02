import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class SignInWidget extends StatefulWidget {
  BuildContext context1;
  LoginState state;

  SignInWidget({required this.context1, required this.state});

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
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
    return Dialog(
      backgroundColor: Color(0xFFCCC5B9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 16,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
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
                child:  TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child:  TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.8, //TODO norm params
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFeb5e28)),
                      ),
                      child: const Text('Sign in'),
                      onPressed: () {
                        ReadContext(widget.context1).read<LoginCubit>().signIn(
                            widget.state,
                            emailController.text,
                            passwordController.text);
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
