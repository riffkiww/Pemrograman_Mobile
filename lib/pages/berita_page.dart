// lib/pages/berita_page.dart

import 'package:flutter/material.dart';
import '../models/news.dart';

final List<NewsItem> staticNews = [
  NewsItem(
    title: 'OpenAI announces platform for making custom ChatGPTs...',
    source: 'The Verge',
    imageUrl: 'assets/openAI.jpg',
    date: '2025/11/13',
  ),
  NewsItem(
    title: 'The National Zoo\'s panda program is ending after more...',
    source: 'CNN',
    imageUrl: 'https://i.imgur.com/example2.png',
    date: '2025/11/10',
  ),
  NewsItem(
    title: 'Mahasiswa IF Itenas Raih Juara 1 Lomba Aplikasi Mobile Regional',
    source: 'ITENAS Press',
    imageUrl: 'https://i.imgur.com/example3.png',
    date: '2025/11/05',
  ),
  NewsItem(
    title: 'Perkembangan Terbaru Android dan Flutter untuk Tahun 2026',
    source: 'Tech News',
    imageUrl: 'https://i.imgur.com/example4.png',
    date: '2025/10/29',
  ),
];

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: staticNews.length,
        itemBuilder: (context, index) {
          final item = staticNews[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Card(
              elevation: 1.5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Gambar Berita
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                          // Ganti dengan NetworkImage atau AssetImage yang valid
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) => const Image(image: AssetImage('assets/placeholder.png')),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Detail Berita
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.source, style: const TextStyle(fontSize: 12, color: Colors.indigo)),
                              Text(item.date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}