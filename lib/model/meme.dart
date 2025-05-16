class Meme {
  final String title;
  final String url;
  final List<String> previews;

  Meme({required this.title, required this.url, required this.previews});

  // Convert JSON to Dart object
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      title: json['title'],
      url: json['url'],
      previews: List<String>.from(json['preview']),
    );
  }
}