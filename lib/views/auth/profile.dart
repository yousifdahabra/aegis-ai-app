import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Profile", style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text("Update your profile", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
