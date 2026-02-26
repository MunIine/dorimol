class TokenException implements Exception {
  const TokenException(this.message);
  
  final String message;

  @override
  String toString() => 'TokenException: $message';
}