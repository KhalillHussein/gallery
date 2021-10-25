part of widgets;

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.iconAsset,
    this.isRequired = false,
  }) : super(key: key);

  final String hintText;
  final String iconAsset;
  final bool isRequired;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isInputActionStarted = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoTextField(
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                isInputActionStarted = false;
              } else {
                isInputActionStarted = true;
              }
            });
          },
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
          ),
          placeholderStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 17,
              ),
          placeholder: widget.hintText,
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              widget.iconAsset,
              width: 20,
            ),
          ),
        ),
        if (widget.isRequired && !isInputActionStarted)
          Positioned(
            left: 7,
            bottom: 0,
            top: 7,
            right: 0,
            child: IgnorePointer(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.hintText,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 17,
                            color: AppColors.colorTransparent,
                          ),
                    ),
                    TextSpan(
                      text: '*',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 17,
                            color: AppColors.colorRed,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
