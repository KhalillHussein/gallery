import 'dart:io';

import 'package:dio/dio.dart';

class MediaObjectApiQuery {
  final File? file;

  MediaObjectApiQuery({
    this.file,
  });

  Map<String, dynamic> toMap() {
    return {
      'file': MultipartFile.fromFileSync(file!.path,
          filename: file!.path.split('/').last),
    };
  }
}
