part of start;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: _currentIndex, children: const [
        HomeTab(),
        SizedBox(),
        ProfileTab(),
      ]),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) => _currentIndex != index
            ? setState(() async {
                _currentIndex = index;
                _currentIndex == 1
                    ? image =
                        await _picker.pickImage(source: ImageSource.gallery)
                    : null;
              })
            : null,
        currentIndex: _currentIndex,
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
      ),
    );
  }
}
