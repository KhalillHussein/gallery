part of widgets;

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.pop(context),
      child: Text(
        AppLocalization.textCancel,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
