import 'dart:io';

class PhotoUploadApiQuery {
  final File? file;
  final String? name;
  final String? description;

  PhotoUploadApiQuery({
    this.file,
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'file': file,
      'name': name,
      'description': description,
    };
  }
}
