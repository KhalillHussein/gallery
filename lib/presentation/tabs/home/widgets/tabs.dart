part of home;

class Tabs extends StatefulWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> tabs = const [
    PhotosGrid(),
    PhotosGrid(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex:
          context.read<PhotosFilterCubit>().state.newCategory! ? 0 : 1,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          context
              .read<PhotosFilterCubit>()
              .applyCategory(isNew: true, isPopular: false);
        } else if (_tabController.index == 1) {
          context
              .read<PhotosFilterCubit>()
              .applyCategory(isNew: false, isPopular: true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isItemsExist =
        context.select<PhotosCubit, bool>((value) => value.state.value != null);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppInsets.insetsPadding,
          ),
          child: AbsorbPointer(
            absorbing: context.select<PhotosCubit, bool>(
                    (value) => value.state.status.isLoading) ||
                !isItemsExist,
            child: TabBar(
              controller: _tabController,
              indicatorColor: isItemsExist
                  ? Theme.of(context).indicatorColor
                  : AppColors.colorTransparent,
              labelColor: isItemsExist
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
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: tabs,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
