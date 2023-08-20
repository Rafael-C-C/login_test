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
      appBar: AppBar(title: const Text("Tus datos de facebook:")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Token de acceso: \n$accessToken',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.blue,
                height: 10,
              ),
              Text(
                'Tu nombre es: \n$profile',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Tu correo es: \n $email',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tu foto de perfil:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.network(
                '$imageUrl',
                height: 100,
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
