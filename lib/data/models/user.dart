import 'package:equatable/equatable.dart';

///Model class to storage user data
class User extends Equatable {
  final int? clientId;
  final String? name;
  final String? locale;

  const User({
    this.clientId,
    this.name,
    this.locale,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      clientId: json['client_id'],
      name: json['name'],
      locale: json['local'],
    );
  }

  @override
  List<Object?> get props => [
        clientId,
        name,
        locale,
      ];
}
