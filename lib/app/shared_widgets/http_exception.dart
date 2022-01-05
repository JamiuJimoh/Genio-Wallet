class HttpException implements Exception {
  final String title;
  final String message;
  HttpException({
    required this.title,
    required this.message,
  });

  @override
  String toString() {
    return 'Title: $title, Message: $message';
  }
}
