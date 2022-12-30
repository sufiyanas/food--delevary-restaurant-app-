import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HotalProfile extends StatelessWidget {
  const HotalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("SignOut")),
      ),
    );
  }
}
