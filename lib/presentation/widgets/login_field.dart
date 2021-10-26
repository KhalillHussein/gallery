part of widgets;

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.iconAsset,
    this.isRequired = false,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final String iconAsset;
  final bool isRequired;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isInputActionStarted = false;
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(_searchListener);
    super.initState();
  }

  bool get isError => widget.errorText != null;

  void _searchListener() {
    setState(() {
      if (_controller.text.isEmpty) {
        isInputActionStarted = false;
      } else {
        isInputActionStarted = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CupertinoTextField(
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isError ? AppColors.colorRed : Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
          ),
          placeholderStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 17,
              ),
          placeholder: widget.hintText,
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              isError ? AppAssets.iconTriangleDanger : widget.iconAsset,
              width: 20,
            ),
          ),
        ),
        if (isError)
          Positioned(
            left: 0,
            bottom: -17,
            child: Text(
              widget.errorText!,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 12,
                    color: AppColors.colorRed,
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
