import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HotalProfile extends StatelessWidget {
  const HotalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final userAuth = FirebaseAuth.instance.currentUser!;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userAuth.email!),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("SignOut")),
          ],
        ),
      ),
    );
  }
}
