class MediaObjectApiQuery {
  final int id;

  MediaObjectApiQuery({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
