part of photo_upload;

class PhotoUploadScreen extends StatelessWidget {
  const PhotoUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
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
              ).gestures(
                onTap: () => Navigator.pop(context),
              ),
              CupertinoTextButton(
                label: AppLocalization.textAdd,
                onPressed: () => Navigator.pop(context),
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 62),
            child: Placeholder(
              fallbackHeight: 251,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoAppBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppInsets.insetsPadding,
                  vertical: 10,
                ),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
