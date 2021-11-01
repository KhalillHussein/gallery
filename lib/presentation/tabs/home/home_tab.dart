part of home;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: AppInsets.insetsPadding,
            ),
            child: SearchBar(),
          ),
          Expanded(child: Tabs()),
        ],
      ),
    );
  }
}
