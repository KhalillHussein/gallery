part of widgets;

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.iconCamera,
      color: AppColors.colorGray_4,
      width: 52,
    )
        .center()
        .decorated(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(99),
        )
        .constrained(width: 100, height: 100);
  }
}
