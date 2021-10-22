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
    return CupertinoButton(
      color: isOutline
          ? AppColors.colorTransparent
          : Theme.of(context).primaryColor,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 9),
      borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
      child: Text(
        label,
        style: isOutline
            ? Theme.of(context).textTheme.button
            : Theme.of(context).primaryTextTheme.button,
      ),
    ).decorated(
      borderRadius: BorderRadius.circular(
        isOutline ? AppInsets.insetsRadius : 0.0,
      ),
      border: Border.all(
        color: isOutline
            ? Theme.of(context).primaryColor
            : AppColors.colorTransparent,
      ),
    );
  }
}
