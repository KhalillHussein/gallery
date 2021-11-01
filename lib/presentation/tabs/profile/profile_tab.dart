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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppAssets.iconChevronLeft,
                height: 16,
              ),
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
            context.read<SignInCubit>().state.value?.username ??
                context.read<SignUpCubit>().state.value!.username!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 8),
          Text(
            context.read<SignInCubit>().state.value?.birthday ??
                context.read<SignUpCubit>().state.value!.formattedDate,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 27),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppInsets.insetsPadding),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalization.textViews,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                      TextSpan(
                        text: ' 999+',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalization.textLoaded,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                      TextSpan(
                        text: ' 999+',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1,
            height: 0,
          ),
          Expanded(child: PhotosGrid()),
        ],
      ),
    );
  }
}
