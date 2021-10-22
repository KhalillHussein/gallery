part of welcome;

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.isOutline = false,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final bool isOutline;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoButton(
      color: isOutline ? AppColors.colorTransparent : theme.primaryColor,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 9),
      borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
      child: Text(
        label,
        style:
            isOutline ? theme.textTheme.button : theme.primaryTextTheme.button,
      ),
    ).decorated(
      borderRadius: BorderRadius.circular(
        isOutline ? AppInsets.insetsRadius : 0.0,
      ),
      border: Border.all(
        color: isOutline ? theme.primaryColor : AppColors.colorTransparent,
      ),
    );
  }
}
