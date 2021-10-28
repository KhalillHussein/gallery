import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String name;
  final String dateCreate;
  final String description;
  final bool newImg;
  final bool popularImg;
  final ImageDataInfo imageDataInfo;
  final String user;

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
      'imageDataInfo': imageDataInfo.toMap(),
      'user': user,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      name: map['name'],
      dateCreate: map['dateCreate'],
      description: map['description'],
      newImg: map['new'],
      popularImg: map['popular'],
      imageDataInfo: map['imageDataInfo'] != null
          ? ImageDataInfo.fromMap(map['imageDataInfo'])
          : map['imageDataInfo'],
      user: map['user'],
    );
  }

  @override
  List<Object> get props {
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
  final int id;
  final String name;
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

  factory ImageDataInfo.fromMap(Map<String, dynamic> map) {
    return ImageDataInfo(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  List<Object> get props => [id, name];
}
