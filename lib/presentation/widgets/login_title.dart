part of widgets;

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.headline1,
    ).border(
      bottom: 2.0,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
