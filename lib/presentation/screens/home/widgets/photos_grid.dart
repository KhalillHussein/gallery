part of home;

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: AppInsets.insetsPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          final photo = photos[index];
          return PhotoItem(photo: photo);
        });
  }
}

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return RequestBuilder<MediaObjectCubit, MediaObject>(
      onError: (context, state, value) => Error(),
      onLoading: (context, state, value) => Loading(),
      onLoaded: (context, state, value) => Image.memory(
        value!.file!,
        fit: BoxFit.cover,
      ).clipRRect(all: 10).elevation(
            4,
            shadowColor: AppColors.colorGray_1,
            borderRadius: BorderRadius.circular(10),
          ),
    );
  }
}
