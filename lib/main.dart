import 'package:chatapp/App_routes/routes.dart';
import 'package:chatapp/Bloc/register_bloc.dart';
import 'package:chatapp/ContactPage.dart';
import 'package:chatapp/firebase_provider.dart';
import 'package:chatapp/onboarding/Sighup_page.dart';
import 'package:chatapp/onboarding/login_page.dart';
import 'package:chatapp/splashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(RepositoryProvider(
    create: (context) => FirebaseProvider(),
    child: BlocProvider(
        create: (context) => RegisterBloc(
            firebaseProvider: RepositoryProvider.of<FirebaseProvider>(context)),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Approutes.Splash_Screen,
      routes: Approutes.routes,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Map<String, dynamic>> mydata = [
    {
      "name": "devashish",
      "subtitle": "hello bro kaha hai aaj \nghoomne chale",
      "time": "12:10 AM",
      "count": "2",
      "img": "assets/images/avatar.png",
    },
    {
      "name": "anil bhai",
      "subtitle": "Hello",
      "time": "6:10 AM",
      "count": "1",
      "img": "assets/images/bussiness-man.png",
    },
    {
      "name": "abrar bhai",
      "subtitle": "good morning",
      "time": "6:10 AM",
      "count": "3",
      "img": "assets/images/man.png",
    },
    {
      "name": "ronak sir",
      "subtitle": "hello sir",
      "time": "11:10 PM",
      "count": "3",
      "img": "assets/images/man.png",
    },
    {
      "name": "wscubetech",
      "subtitle": "hello everyone",
      "time": "7:10 AM",
      "count": "3",
      "img": "assets/images/bussiness-man.png",
    },
    {
      "name": "kaif",
      "subtitle": "hey",
      "time": "12:10 AM",
      "count": "3",
      "img": "assets/images/bussiness-man.png",
    },
    {
      "name": "urooj",
      "subtitle": "hello bro",
      "time": "12:10 AM",
      "count": "3",
      "img": "assets/images/bussiness-man.png",
    },
    {
      "name": "umair",
      "subtitle": "please help me find a good moniter",
      "time": "12:10",
      "count": "3",
      "img": "assets/images/bussiness-man.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(FirebaseProvider.Login_pref_key, "");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contetx) {
                    return LoginPage();
                  }));
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          actions: [],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mengobrol"),
              Icon(Icons.search),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              margin: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                              child: Image.asset(
                            "assets/icons/icons8-add-50.png",
                            width: 50,
                          )),
                        ),
                        Text(
                          "add",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: mydata.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.green,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: Image.asset(
                                      mydata[index]["img"],
                                      width: 50,
                                    ),
                                  ),
                                ),
                              ),
                              Text(mydata[index]["name"]),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: Text(
                    "chats",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mydata.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    mydata[index]["name"],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    mydata[index]["subtitle"],
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.green),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        mydata[index]["img"],
                        // width: 35,
                        //height: 40,
                      ),
                    ),
                  ),
                  trailing: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mydata[index]["time"],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                            child: Center(
                                child: Text(
                              mydata[index]["count"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ))),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // margin: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
                spreadRadius: 3,
                offset: Offset(0, 3))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ContactPage();
                                }));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.message),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("new chat"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.contact_page_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("new contact"),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.people_outline),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("new community"),
                              ],
                            ),
                          ],
                        );
                      });
                },
                child: Text("+add")),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
