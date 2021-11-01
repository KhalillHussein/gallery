part of home;

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSuccess =
        context.select<PhotosCubit, bool>((value) => value.state.value != null);
    return DefaultTabController(
      length: 2,
      child: Column(
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
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: const [
                PhotosGrid(popularImages: false),
                PhotosGrid(newImages: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
