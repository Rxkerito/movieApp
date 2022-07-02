import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/domain/usecases/signout.dart';
import 'package:practice/presentation/cubit/login_cubit.dart';
import 'package:practice/presentation/cubit/login_state.dart';
import 'package:practice/presentation/widgets/login_widget.dart';

class ProfilePage extends StatefulWidget {
  SignOutUseCase signOutUseCase = SignOutUseCase();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          ReadContext(context).read<LoginCubit>().checkState(state);

          if (state is UserNotLogged) {
            return Scaffold(
              appBar: AppBar(title: const Text('Profile'), backgroundColor: Color(0xFFeb5e28),),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.075,
                          right: MediaQuery.of(context).size.width * 0.075),
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    size: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: Color(0xFF403D39),
                                  ),
                                  Text(
                                    'You are not authorized',
                                    style: TextStyle(
                                        color: Color(0xFF403D39),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    textDirection: TextDirection.ltr,
                                  )
                                ],
                              )),
                              Container()
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: const BoxDecoration(
                              color: Color(0xFFCCC5B9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: LogInWidget(
                              context1: context,
                              state: state,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFCCC5B9),
                                fixedSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'About',
                                style: TextStyle(color: Color(0xFF403D39)),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFCCC5B9),
                                fixedSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Support',
                                style: TextStyle(color: Color(0xFF403D39)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is UserLogged) {
            return Scaffold(
              appBar: AppBar(title: const Text('Profile'), backgroundColor: Color(0xFFeb5e28),),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.075,
                          right: MediaQuery.of(context).size.width * 0.075),
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    size: MediaQuery.of(context).size.height *
                                        0.08,
                                    color: Color(0xFF403D39),
                                  ),
                                  Text(
                                    state.email,
                                    style: TextStyle(
                                        color: Color(0xFF403D39),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    textDirection: TextDirection.ltr,
                                  )
                                ],
                              )),
                              Container()
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.035),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              // color: Color(0xFFCCC5B9),
                              border: Border.all(
                                color: Color(0xFF403D39),
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              //TODO basket & discount
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.2),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFCCC5B9),
                                    fixedSize: const Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Basket',
                                    style: TextStyle(color: Color(0xFF403D39)),
                                  ),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFCCC5B9),
                                    fixedSize: const Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Support',
                                    style: TextStyle(color: Color(0xFF403D39)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFCCC5B9),
                                    fixedSize: const Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'About',
                                    style: TextStyle(color: Color(0xFF403D39)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFCCC5B9),
                                    fixedSize: const Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    ReadContext(context)
                                        .read<LoginCubit>()
                                        .signOut(state);
                                  }, //TODO signout in cubit
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(color: Color(0xFF403D39)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold();
        },
      ),
    );
  }
}
