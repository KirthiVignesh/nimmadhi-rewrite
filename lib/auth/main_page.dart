import 'package:nimmadhi/auth/auth_page.dart';
import 'package:nimmadhi/pages/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.idTokenChanges(),
          builder: (context, snapshot) {
            //print(snapshot.hasData);
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                return AppRoute();
              } else {
                return AuthPage();
              }
            } else {
              return CircularProgressIndicator(
                color: Colors.deepPurple,
              );
            }
          }),
    );
  }
}
