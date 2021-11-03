part of photo_detail;

class PhotoInfo extends StatelessWidget {
  const PhotoInfo({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              photo.name ?? '---',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                  ),
            ),
            Row(
              children: [
                Text(
                  '999+',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 12),
                ),
                const SizedBox(width: 2),
                SvgPicture.asset(
                  AppAssets.iconEye,
                  width: 14,
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              photo.user ?? '---',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 15,
                  ),
            ),
            Text(
              photo.formattedDate,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          photo.description ?? '---',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
