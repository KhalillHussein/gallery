part of home;

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: AppInsets.insetsPadding,
            ),
            child: SearchBar(
              onChanged: (value) async {
                await Future.delayed(
                  Duration(milliseconds: 200),
                  () => context.read<PhotosFilterCubit>().search(value),
                );
              },
            ),
          ),
          Expanded(child: Tabs()),
        ],
      ),
    );
  }
}
