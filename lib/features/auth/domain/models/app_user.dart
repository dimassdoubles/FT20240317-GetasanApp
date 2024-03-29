import 'package:getasan_app/features/desa/domain/models/desa.dart';

class AppUser {
  final String id;
  final String name;
  final String profilePict;
  final Desa desa;
  final String email;

  AppUser({
    required this.id,
    required this.name,
    required this.profilePict,
    required this.desa,
    required this.email,
  });
}
