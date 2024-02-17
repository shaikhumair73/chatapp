import 'dart:ui';

import 'package:chatapp/Bloc/register_bloc.dart';
import 'package:chatapp/costum/Model.dart';
import 'package:chatapp/firebase_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../costum/list_dara.dart';
import 'login_page.dart';

class SighnUp extends StatelessWidget {
//  const SighnUp({super.key});
  var controlerMail = TextEditingController();
  var controlerPass = TextEditingController();
  var controler1 = TextEditingController();
  var mFormKey = GlobalKey<FormState>();
  static Widgetbuilder() {
    return RepositoryProvider(
      create: (context) => FirebaseProvider(),
      child: BlocProvider(
          create: (context) => RegisterBloc(
              firebaseProvider:
                  RepositoryProvider.of<FirebaseProvider>(context)),
          child: SighnUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: mFormKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 40,
              ),
              CostumTextfeild(
                  validater: (value) {
                    if (value!.length <= 7) {
                      return "length should be greater than 7";
                    }
                  },
                  labelText: "username",
                  PrifixIcon: Icon(Icons.account_circle),
                  controler: controler1,
                  hintText: "enter your username"),
              SizedBox(
                height: 20,
              ),
              CostumTextfeild(
                  validater: (value) {
                    const pattern =
                        //((\[[0-9]{1,3}\.'r'[0-9]{1,3}\.[0-9]{1,3}\
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.'
                        r'[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    final regexp = RegExp(pattern);

                    if (value!.isEmpty) {
                      return "email does not exist";
                    } else if (!regexp.hasMatch(value)) {
                      return "enter valid email";
                    }
                  },
                  labelText: "Email",
                  PrifixIcon: Icon(Icons.mail),
                  controler: controlerMail,
                  hintText: "enter your email"),
              SizedBox(
                height: 20,
              ),
              CostumTextfeild(
                  validater: (value) {
                    if (value!.length <= 7) {
                      return "length should be greater than 7";
                    }
                  },
                  labelText: "password",
                  PrifixIcon: Icon(Icons.remove_red_eye),
                  controler: controlerPass,
                  hintText: "enter your password"),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is OnLoaded) {
                    Navigator.pop(context);
                  } else if (state is OnError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${state.error}")));
                  }
                },
                builder: (context, state) {
                  if (state is OnLoading) {
                    return SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 11,
                              ),
                              Text("loading"),
                            ],
                          )),
                    );
                  }
                  return SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (mFormKey.currentState!.validate()) {
                            String password = controlerPass.text.toString();
                            var Newuser = Usermodel(
                                name: "name",
                                mobNo: "7398106637",
                                email: controlerMail.text.toString(),
                                gender: "Male",
                                isOnline: false,
                                status: 1,
                                profile: "",
                                profileStatus: 1);
                            BlocProvider.of<RegisterBloc>(context).add(
                                Createaccount(
                                    dataModel: Newuser, pass: password));
                          }
                        },
                        child: Text("Sighn up")),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Already have an account  "),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text(
                        "Login now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
