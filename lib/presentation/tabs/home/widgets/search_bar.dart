part of home;

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isInputActionStarted = false;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController(
        text: context.read<PhotosFilterCubit>().state.keyword);
    _focusNode = FocusNode();
    _controller.addListener(_searchListener);
    super.initState();
  }

  void _searchListener() {
    if (_controller.text.isEmpty) {
      setState(() {
        isInputActionStarted = false;
      });
    } else {
      setState(() {
        isInputActionStarted = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoSearchTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            prefixInsets: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 2),
            suffixInsets: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            prefixIcon: Icon(CupertinoIcons.search, size: 18),
            suffixIcon: isInputActionStarted
                ? Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: AppColors.colorGray_3,
                    size: 18,
                  )
                : Icon(
                    CupertinoIcons.mic_fill,
                    color: AppColors.colorGray_3,
                  ),
            suffixMode: OverlayVisibilityMode.always,
          ),
        ),
        if (isInputActionStarted && _focusNode.hasPrimaryFocus)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: CupertinoTextButton(
              label: AppLocalization.textCancel,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 17,
                    color: CupertinoColors.activeBlue,
                  ),
              onPressed: () {
                _controller.clearComposing();
                _focusNode.unfocus();
              },
            ),
          )
      ],
    );
  }
}
