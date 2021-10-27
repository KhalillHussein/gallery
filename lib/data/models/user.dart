import 'package:equatable/equatable.dart';

///Model class to storage user data
class User extends Equatable {
  final String? birthday;
  final List<dynamic>? photos;
  final String? username;
  final String? email;
  const User({
    this.birthday,
    this.photos,
    this.username,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'birthday': birthday,
      'photos': photos,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      birthday: map['birthday'],
      photos: map['photos'],
      username: map['username'],
      email: map['email'],
    );
  }

  @override
  List<Object?> get props => [
        birthday,
        photos,
        username,
        email,
      ];
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
