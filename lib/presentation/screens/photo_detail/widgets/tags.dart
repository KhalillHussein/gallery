part of photo_detail;

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: [
        for (int i = 0; i < 10; i++)
          Text(
            '---',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12, color: AppColors.colorWhite),
          ).padding(vertical: 6, horizontal: 18).decorated(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(16),
              ),
      ],
    );
  }
}
