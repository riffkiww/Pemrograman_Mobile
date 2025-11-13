import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Timer 5 detik
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Konten Splash Screen: Judul Aplikasi, Foto, NIM, Nama
            Text(
              'Aplikasi UTS Mobile IF',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            SizedBox(height: 30),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/myfoto.jpg'),// Ganti dengan Image.asset('assets/foto_anda.png') setelah setup assets
              child: Text(''),
            ),
            SizedBox(height: 20),
            Text('152023133'), // Ganti dengan NIM Anda
            Text('Muhamad Riki Fitriansyah Gunadi'), // Ganti dengan Nama Anda
          ],
        ),
      ),
    );
  }
}