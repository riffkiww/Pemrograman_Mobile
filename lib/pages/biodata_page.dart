import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String? _selectedProdi;
  String? _selectedGender = 'Pria';
  DateTime _selectedDate = DateTime.now();

  final List<String> _prodiList = ['Informatika', 'Teknik Industri', 'Arsitektur'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menghitung padding bottom yang aman
    final double bottomNavHeight = MediaQuery.of(context).padding.bottom + 70.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Background Off-White
      body: SingleChildScrollView(
        // Solusi Overflow: Menggunakan padding bottom yang besar
        padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: bottomNavHeight),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- Image Foto Profile ---
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.indigo.withOpacity(0.5), blurRadius: 15.0, offset: const Offset(0, 5)),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.indigo,
                      backgroundImage: const AssetImage('assets/myfoto.jpg'),
                      onBackgroundImageError: (exception, stackTrace) => const Center(child: Text('FOTO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
                const SizedBox(height: 25), // Spasi dikurangi

                const Text('DATA MAHASISWA', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.indigo)),
                const Divider(thickness: 2, color: Colors.indigo),

                // --- Teks Input (NIM) ---
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.credit_card, color: Colors.indigo),
                  ),
                  initialValue: '152023133',
                ),
                const SizedBox(height: 10),
                // --- Teks Input (Nama) ---
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                  ),
                  initialValue: 'Muhamad Riki Fitriansyah Gunadi',
                ),
                const SizedBox(height: 15),

                // --- Dropdown ---
                const Text('Program Studi:', style: TextStyle(fontWeight: FontWeight.w500)),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.school, color: Colors.indigo),
                  ),
                  value: _selectedProdi,
                  hint: const Text('Pilih Program Studi'),
                  isExpanded: true,
                  items: _prodiList.map((String value) { return DropdownMenuItem<String>(value: value, child: Text(value)); }).toList(),
                  onChanged: (String? newValue) { setState(() { _selectedProdi = newValue; }); },
                ),
                const SizedBox(height: 15),

                // --- Radio Button ---
                const Text('Jenis Kelamin:', style: TextStyle(fontWeight: FontWeight.w500)),
                Row(
                  children: <Widget>[
                    Expanded(child: RadioListTile<String>(title: const Text('Pria'), value: 'Pria', groupValue: _selectedGender, activeColor: Colors.indigo, onChanged: (String? value) { setState(() { _selectedGender = value; }); })),
                    Expanded(child: RadioListTile<String>(title: const Text('Wanita'), value: 'Wanita', groupValue: _selectedGender, activeColor: Colors.indigo, onChanged: (String? value) { setState(() { _selectedGender = value; }); })),
                  ],
                ),
                const SizedBox(height: 15),

                // --- Calendar Input ---
                const Text('Tanggal Lahir:', style: TextStyle(fontWeight: FontWeight.w500)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(DateFormat('dd MMMM yyyy').format(_selectedDate), style: const TextStyle(fontSize: 16)),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.calendar_today, size: 18, color: Colors.white),
                        label: const Text('Pilih Tanggal', style: TextStyle(color: Colors.white)),
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo.shade600,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol Simpan
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Biodata Berhasil Diinput (Tidak Disimpan ke DB)')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    child: const Text('SIMPAN', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 10), // Tambahkan sedikit spasi di akhir Column
              ],
            ),
          ),
        ),
      ),
    );
  }
}