part of home;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppInsets.insetsRadius,
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SearchBar(),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      height: 28,
                      text: AppLocalization.textNew,
                    ),
                    Tab(
                      height: 28,
                      text: AppLocalization.textPopular,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Loading(),
                      Error(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.iconHome,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.iconCamera,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.iconProfile,
            ),
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isInputActionStarted = false;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
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
                _controller.clear();
                _focusNode.unfocus();
              },
            ),
          )
      ],
    );
  }
}
