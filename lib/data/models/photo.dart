import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int? id;
  final String? name;
  final String? dateCreate;
  final String? description;
  final bool? newImg;
  final bool? popularImg;
  final ImageDataInfo? imageDataInfo;
  final String? user;

  const Photo({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.newImg,
    required this.popularImg,
    required this.imageDataInfo,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateCreate': dateCreate,
      'description': description,
      'new': newImg,
      'popular': popularImg,
      'imageDataInfo': imageDataInfo?.toMap(),
      'user': user,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int?,
      name: map['name'] as String?,
      dateCreate: map['dateCreate'] as String?,
      description: map['description'] as String?,
      newImg: map['new'] as bool?,
      popularImg: map['popular'] as bool?,
      imageDataInfo:
          ImageDataInfo.fromMap(map['imageDataInfo'] as Map<String, dynamic>?),
      user: map['user'] as String?,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      dateCreate,
      description,
      newImg,
      popularImg,
      imageDataInfo,
      user,
    ];
  }
}

class ImageDataInfo extends Equatable {
  final int? id;
  final String? name;
  const ImageDataInfo({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ImageDataInfo.fromMap(Map<String, dynamic>? map) {
    return ImageDataInfo(
      id: map?['id'] as int?,
      name: map?['name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
