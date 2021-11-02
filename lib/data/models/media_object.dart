import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class MediaObject extends Equatable {
  final int? id;
  final Uint8List? file;
  final String? name;

  const MediaObject({
    this.id,
    this.file,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'file': file,
      'name': name,
    };
  }

  factory MediaObject.fromMap(Map<String, dynamic> map) {
    return MediaObject(
      id: map['id'] as int?,
      file: map['file'] != null
          ? base64.decode(map['file'].split(',').last)
          : base64.decode(''),
      name: map['name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, file, name];
}
