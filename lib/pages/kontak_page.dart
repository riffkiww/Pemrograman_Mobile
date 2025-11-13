import 'package:flutter/material.dart';
import '../models/contact.dart';

final List<Contact> staticContacts = [
  Contact(name: 'Andi Bachtiar', phone: '0812-1111-2222', initial: 'AB'),
  Contact(name: 'Budi Santoso', phone: '0812-2222-3333', initial: 'BS'),
  Contact(name: 'Citra Dewi', phone: '0813-3333-4444', initial: 'CD'),
  Contact(name: 'Dian Nugraha', phone: '0815-4444-5555', initial: 'DN'),
  Contact(name: 'Eko Prasetyo', phone: '0852-5555-6666', initial: 'EP'),
  Contact(name: 'Fani Lestari', phone: '0811-6666-7777', initial: 'FL'),
  Contact(name: 'Galih Ashari R', phone: '0812-7777-8888', initial: 'GA'),
  Contact(name: 'Hadi Kurniawan', phone: '0817-8888-9999', initial: 'HK'),
  Contact(name: 'Indah Permata', phone: '0818-9999-0000', initial: 'IP'),
  Contact(name: 'Joko Susilo', phone: '0819-0000-1111', initial: 'JS'),
  Contact(name: 'Kartika Sari', phone: '0821-1111-2222', initial: 'KS'),
  Contact(name: 'Lucky Wijaya', phone: '0822-2222-3333', initial: 'LW'),
  Contact(name: 'Mira Amelia', phone: '0823-3333-4444', initial: 'MA'),
  Contact(name: 'Nanda Pratama', phone: '0824-4444-5555', initial: 'NP'),
  Contact(name: 'Oscar Fernando', phone: '0825-5555-6666', initial: 'OF'),
];

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Background Off-White
      body: ListView.builder(
        itemCount: staticContacts.length,
        itemBuilder: (context, index) {
          final contact = staticContacts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 6, // Bayangan lebih jelas
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.indigo.shade400,
                  child: Text(contact.initial, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                ),
                title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                subtitle: Text(contact.phone, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                trailing: const Icon(Icons.phone_in_talk, color: Colors.green),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Simulasi Panggilan ke ${contact.name}')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}