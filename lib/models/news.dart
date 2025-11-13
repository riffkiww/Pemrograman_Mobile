// lib/models/news.dart

class NewsItem {
  final String title;
  final String source;
  final String date;
  // Gunakan asset atau network image
  final String imageUrl;

  NewsItem({required this.title, required this.source, required this.date, required this.imageUrl});
}