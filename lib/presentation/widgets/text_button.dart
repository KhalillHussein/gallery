part of widgets;

class CupertinoTextButton extends StatelessWidget {
  const CupertinoTextButton({
    Key? key,
    required this.label,
    required this.style,
    required this.onPressed,
    this.isFilled = false,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String label;
  final TextStyle style;
  final VoidCallback onPressed;
  final bool isFilled;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      minSize: 0,
      borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
      onPressed: onPressed,
      color: isFilled
          ? Theme.of(context).primaryColor
          : AppColors.colorTransparent,
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
