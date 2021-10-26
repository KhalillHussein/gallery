part of widgets;

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.iconError),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              AppLocalization.textSorry,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
            ),
          ),
          Text(
            AppLocalization.textNoPictures,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
