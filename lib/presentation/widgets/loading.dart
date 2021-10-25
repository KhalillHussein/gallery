part of widgets;

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(strokeWidth: 1),
          const SizedBox(height: 10),
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
