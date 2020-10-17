import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth_screen.dart';

class YourCustomerServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, usersnapshot) {
          if (usersnapshot.hasData)
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('yourService screen'),
              ),
              body: Center(
                child: Text('how may i help u'),
              ),
            );
          return AuthScreen();
        });
  }
}
