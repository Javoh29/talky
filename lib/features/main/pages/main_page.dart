import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/app.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Main Page'),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  App.restartApp(context);
                });
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
