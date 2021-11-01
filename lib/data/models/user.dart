import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

///Model class to storage user data
class User extends Equatable {
  final int? id;
  final String? birthday;
  final List<dynamic>? photos;
  final String? username;
  final String? email;

  const User({
    this.id,
    this.birthday,
    this.photos,
    this.username,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'birthday': birthday,
      'photos': photos,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      birthday: map['birthday'] as String?,
      photos: map['photos'] as List<dynamic>?,
      username: map['username'] as String?,
      email: map['email'] as String?,
      id: map['id'] as int?,
    );
  }

  @override
  List<Object?> get props => [
        birthday,
        photos,
        username,
        email,
        id,
      ];

  String get formattedDate =>
      DateFormat('dd.MM.yyyy').format(DateTime.parse(birthday!));

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

// {
//   "phone": "string",
//   "fullName": "string",
//   "oldPassword": "string",
//   "newPassword": "string",
//   "birthday": "2021-10-25T18:47:51.384Z",
//   "photos": [
//     "string"
//   ],
//   "code": "string",
//   "user": true,
//   "rolesRaw": [
//     "string"
//   ],
//   "username": "string",
//   "roles": [
//     "string"
//   ],
//   "id": 0,
//   "usernameCanonical": "string",
//   "salt": "string",
//   "email": "string",
//   "emailCanonical": "string",
//   "password": "string",
//   "plainPassword": "string",
//   "lastLogin": "2021-10-25T18:47:51.384Z",
//   "confirmationToken": "string",
//   "accountNonExpired": true,
//   "accountNonLocked": true,
//   "credentialsNonExpired": true,
//   "enabled": true,
//   "superAdmin": true,
//   "passwordRequestedAt": "2021-10-25T18:47:51.384Z",
//   "groups": [
//     "string"
//   ],
//   "group": [
//     "string"
//   ]
// }
