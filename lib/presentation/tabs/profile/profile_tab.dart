part of profile;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoAppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            12,
            AppInsets.insetsPadding,
            12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppAssets.iconSettings,
                height: 21,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ).gestures(
                onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 21),
          Center(child: Avatar()),
          const SizedBox(height: 10),
          Text(
            context.read<AuthenticationCubit>().state.user!.username!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 8),
          Text(
            context.read<AuthenticationCubit>().state.user!.formattedDate,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 27),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppInsets.insetsPadding),
            child: Row(
              children: [
                Info(
                  title: AppLocalization.textViews,
                  subtitle: ' 0',
                ),
                const SizedBox(width: 20),
                Info(
                  title: AppLocalization.textLoaded,
                  subtitle: context.select<PhotosCubit, String>(
                      (value) => ' ${value.totalItems}'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1,
            height: 0,
          ),
          Expanded(
              child: PhotosGrid(
            galleryType: GalleryType.user,
          )),
        ],
      ),
    );
  }
}
