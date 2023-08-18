import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? accessToken;
  final String? profile;
  final String? userId;
  final String? email;
  final String? imageUrl;
  const HomeScreen(
      {super.key,
      this.accessToken,
      this.profile,
      required this.imageUrl,
      required this.userId,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreem")),
      body: Center(
        child: Column(
          children: [
            Text('Access token: $accessToken'),
            Container(
              color: Colors.red,
              height: 10,
            ),
            Text('$profile'),
            Text('And your email is $email'),
            Image.network(
              '$imageUrl',
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
