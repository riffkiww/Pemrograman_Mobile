import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Daftar 5 Widget menu [cite: 16]
  static const List<Widget> _widgetOptions = <Widget>[
    const BiodataPage(),
    const KontakPage(),
    const KalkulatorPage(),
    const CuacaPage(),
    const BeritaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Menu'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar( // Contoh Bottom Navigation [cite: 15]
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Cuaca'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}