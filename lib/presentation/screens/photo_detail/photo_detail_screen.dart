part of photo_detail;

class PhotoDetailScreen extends StatelessWidget {
  const PhotoDetailScreen({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoAppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            12,
            AppInsets.insetsPadding,
            12,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconChevronLeft,
                height: 16,
              ).gestures(
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            photo.photoUrl,
            height: 251,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 11, horizontal: AppInsets.insetsPadding),
            child: PhotoInfo(photo: photo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4, horizontal: AppInsets.insetsPadding),
            child: Tags(),
          ),
        ],
      ),
    );
  }
}
