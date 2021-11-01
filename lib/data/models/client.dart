import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int? id;
  final String? name;
  final String? randomId;
  final String? secret;
  final List<String>? allowedGrantTypes;

  const Client({
    this.id,
    this.name,
    this.randomId,
    this.secret,
    this.allowedGrantTypes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'randomId': randomId,
      'secret': secret,
      'allowedGrantTypes': allowedGrantTypes,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      randomId: map['randomId'],
      secret: map['secret'],
      allowedGrantTypes: List<String>.from(map['allowedGrantTypes']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        randomId,
        secret,
        allowedGrantTypes,
      ];
}















// {
//   "id": 0,
//   "name": "string",
//   "randomId": "string",
//   "secret": "string",
//   "allowedGrantTypes": [
//     "string"
//   ]
// }