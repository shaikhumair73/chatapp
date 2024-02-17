import 'package:chatapp/App_routes/routes.dart';
import 'package:chatapp/Bloc/register_bloc.dart';
import 'package:chatapp/firebase_provider.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../costum/list_dara.dart';
import 'Sighup_page.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  var controlerEmail = TextEditingController();
  var controlerPass = TextEditingController();
  final mFormKey = GlobalKey<FormState>();
  //routes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: mFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CostumTextfeild(
                    validater: (value) {
                      if (value!.isEmpty) {
                        return "Email cant be empty!";
                      }
                    },
                    labelText: "Email",
                    controler: controlerEmail,
                    PrifixIcon: Icon(Icons.mail),
                    hintText: ("enter your email"),
                  ),
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
                    controler: controlerPass,
                    PrifixIcon: Icon(Icons.remove_red_eye),
                    hintText: "enter your pass",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (mFormKey.currentState!.validate()) {
                            BlocProvider.of<RegisterBloc>(context).add(
                                AuthenticateAccount(
                                    mail: controlerEmail.text.toString(),
                                    pass: controlerPass.text.toString()));
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MyHomePage();
                            }));
                          }
                        },
                        child: Text("Sign in")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("don't have an account  "),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Approutes.Sighnup_screen);
                          },
                          child: Text(
                            "create now",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
/*try {
var fireAuth = FirebaseAuth.instance;
var userCred =
await fireAuth.signInWithEmailAndPassword(
email: controlerEmail.text.toString(),
password: controlerPass.text.toString());
var UUID = userCred.user!.uid;
if (userCred.user != null) {
var pref =
await SharedPreferences.getInstance();
var id = pref.setString(
FirebaseProvider.Login_pref_key, UUID);
}
Navigator.push(context,
MaterialPageRoute(builder: (context) {
return MyHomePage();
}));
} on FirebaseAuthException catch (e) {
if (e.code == 'user-not-found') {
print('No user found for that email.');
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
"No user found for that email")));
} else if (e.code == 'wrong-password') {
print('Wrong password provided for that user.');
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
content: Text(
"Wrong password provided for that user")));
}
}

 */
