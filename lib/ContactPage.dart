import 'package:chatapp/costum/Model.dart';
import 'package:chatapp/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var Userid;
  Future<void> getUserId() async {
    var pref = await SharedPreferences.getInstance();
    Userid = pref.getString(FirebaseProvider.Login_pref_key);
  }

  @override
  Widget build(BuildContext context) {
    getUserId();
    return Scaffold(
      appBar: AppBar(
        title: Text("New Chats"),
      ),
      body: FutureBuilder(
        future: FirebaseProvider.getAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text("${snapshot.hasError}");
            } else if (snapshot.hasData) {
              List<Usermodel> user = [];
              for (QueryDocumentSnapshot<Map<String, dynamic>> eachdoc
                  in snapshot.data!.docs) {
                var eachUser = Usermodel.fromDoc(eachdoc.data());
                if (eachdoc.id != Userid) {
                  user.add(eachUser);
                }
              }
              return ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: user[index].profile != ""
                            ? Image.network(user[index].profile!)
                            : Icon(Icons.account_circle),
                      ),
                      title: Text("${user[index].name!}"),
                      subtitle: Text("${user[index].email!}"),
                    );
                  });
            }
            return Container();
          }
        },
      ),
    );
  }
}
