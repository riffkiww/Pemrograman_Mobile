// lib/pages/cuaca_page.dart

import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  // Data Cuaca Statis Sesuai Permintaan
  final String location = 'Bandung, Indonesia';
  final String temperature = '22°';
  final String condition = 'Cerah Berawan';
  final int humidity = 65;
  final int windSpeed = 10;

  Widget _buildDetailItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blueAccent),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Lokasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, size: 20, color: Colors.indigo),
                  const SizedBox(width: 5),
                  Text(location, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 30),

              // Kartu Cuaca Utama
              Container(
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade300, Colors.blue.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    // Suhu
                    Text(
                      temperature,
                      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w100, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    // Kondisi Cuaca (Gambar/Animasi)
                    Icon(
                      Icons.wb_cloudy, // Ganti dengan animasi jika Anda menggunakan Lottie
                      size: 80,
                      color: Colors.yellow.shade100,
                    ),
                    const SizedBox(height: 15),
                    Text(condition, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Detail Cuaca (Kelembaban, Angin, dll.)
              const Text('DETAIL HARI INI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildDetailItem(Icons.water_drop, '$humidity%', 'Kelembaban'),
                    _buildDetailItem(Icons.air, '$windSpeed km/h', 'Angin'),
                    _buildDetailItem(Icons.thermostat, '22°/17°', 'Min/Maks'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}