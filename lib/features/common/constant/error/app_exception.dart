class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class AppAuthException extends AppException {
  AppAuthException(super.message);
}

class AppClientException extends AppException {
  AppClientException(super.message);
}

class AppServerException extends AppException {
  AppServerException(super.message);
}
