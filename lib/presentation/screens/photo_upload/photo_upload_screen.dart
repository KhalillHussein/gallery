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
          Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppInsets.insetsPadding,
                vertical: 10,
              ),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Column(
                children: [
                  CupertinoTextField(
                    placeholder: AppLocalization.textName,
                  ),
                  CupertinoTextField(
                    placeholder: AppLocalization.textDescription,
                    maxLines: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
