class AppFailure {
  final String message;

  AppFailure(this.message);
}

class AuthFailure extends AppFailure {
  AuthFailure(super.message);
}

class ClientFailure extends AppFailure {
  ClientFailure(super.message);
}

class ServerFailure extends AppFailure {
  ServerFailure(super.message);
}

class NetworkFailure extends AppFailure {
  NetworkFailure(super.message);
}
