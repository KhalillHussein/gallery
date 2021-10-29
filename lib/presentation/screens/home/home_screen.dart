part of home;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: AppInsets.insetsPadding,
                ),
                child: SearchBar(),
              ),
              Expanded(child: BodyTabsContent()),
            ],
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

class BodyTabsContent extends StatelessWidget {
  const BodyTabsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSuccess = context
        .select<PhotosCubit, bool>((element) => element.state.status.isSuccess);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppInsets.insetsPadding,
          ),
          child: TabBar(
            indicatorColor: isSuccess
                ? Theme.of(context).indicatorColor
                : AppColors.colorTransparent,
            labelColor: isSuccess
                ? Theme.of(context).tabBarTheme.labelColor
                : Theme.of(context).tabBarTheme.unselectedLabelColor,
            tabs: const [
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
        ),
        Expanded(
          child: RequestBuilder<PhotosCubit, List<Photo>>(
            onError: (context, state, value) => Error(),
            onLoading: (context, state, value) => Loading(),
            onLoaded: (context, state, value) => TabBarView(
              children: [
                PhotosGrid(photos: value ?? []),
                Error(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
