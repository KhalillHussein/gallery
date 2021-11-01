part of widgets;

enum LoadingType { page, list }

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.loadingType = LoadingType.page,
  }) : super(key: key);

  final LoadingType loadingType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(strokeWidth: 1),
          if (loadingType == LoadingType.page) const SizedBox(height: 10),
          if (loadingType == LoadingType.page)
            Text(
              AppLocalization.textLoading,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
            ),
        ],
      ),
    );
  }
}
