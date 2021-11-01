part of start;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;
  final ImagePicker _picker = ImagePicker();
  final List<Widget> tabs = [
    HomeTab(),
    SizedBox(),
    ProfileTab(),
  ];
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs.elementAt(_currentIndex),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) async {
          switch (index) {
            case 0:
              goToNextTab(index);
              break;
            case 1:
              // image = await _picker.pickImage(source: ImageSource.gallery);
              Navigator.pushNamed(context, AppRoutes.photoUpload);
              break;
            case 2:
              goToNextTab(index);
              break;
          }
        },
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

  void goToNextTab(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
