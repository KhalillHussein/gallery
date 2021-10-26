part of widgets;

enum TextFieldType {
  password,
  date,
  email,
}

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.iconAsset,
    this.isRequired = false,
    this.errorText,
    this.onChanged,
    this.fieldType,
  }) : super(key: key);

  final String hintText;
  final String iconAsset;
  final bool isRequired;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextFieldType? fieldType;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isInputActionStarted = false;
  late bool _isObscure;
  late final TextEditingController _controller;

  @override
  void initState() {
    _isObscure = widget.fieldType == TextFieldType.password;
    _controller = TextEditingController();
    _controller.addListener(_searchListener);
    super.initState();
  }

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

  bool get isError => widget.errorText != null;
  TextInputType get keyboardType {
    switch (widget.fieldType) {
      case TextFieldType.date:
        return TextInputType.number;
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.password:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CupertinoTextField(
          controller: _controller,
          onChanged: widget.onChanged,
          keyboardType: keyboardType,
          inputFormatters: [
            if (widget.fieldType == TextFieldType.date) DateInputFormatter(),
          ],
          obscureText: _isObscure,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: isError
                    ? AppColors.colorRed
                    : Theme.of(context).textTheme.bodyText1!.color,
              ),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isError ? AppColors.colorRed : Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
          ),
          placeholderStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 17,
                color: isError
                    ? AppColors.colorRed
                    : Theme.of(context).textTheme.caption!.color,
              ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          placeholder: widget.hintText,
          suffix: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              isError ? AppAssets.iconTriangleDanger : widget.iconAsset,
              width: 20,
            ).gestures(
                onTap: widget.fieldType == TextFieldType.password
                    ? () => setState(() {
                          _isObscure = !_isObscure;
                        })
                    : null),
          ),
        ),
        if (isError)
          Positioned(
            left: 10,
            bottom: -20,
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
            left: 12,
            bottom: 0,
            top: 7,
            right: 0,
            child: _Asterisk(
              textPadding: widget.hintText,
            ),
          ),
      ],
    );
  }
}

class _Asterisk extends StatelessWidget {
  const _Asterisk({
    Key? key,
    required this.textPadding,
  }) : super(key: key);

  final String textPadding;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: textPadding,
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
    );
  }
}
