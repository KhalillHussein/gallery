part of widgets;

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.headline1,
    ).border(
      bottom: 2.0,
      color: theme.colorScheme.secondary,
    );
  }
}
