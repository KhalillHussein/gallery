part of widgets;

enum LoadingType { withLabel, withoutLabel }

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.loadingType = LoadingType.withLabel,
  }) : super(key: key);

  final LoadingType loadingType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(strokeWidth: 1),
          if (loadingType == LoadingType.withLabel) const SizedBox(height: 10),
          if (loadingType == LoadingType.withLabel)
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
