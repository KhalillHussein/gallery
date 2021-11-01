part of photo_create;

class PhotoCreateScreen extends StatelessWidget {
  const PhotoCreateScreen({Key? key}) : super(key: key);

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
        children: const [
          SizedBox(height: 62),
          Placeholder(fallbackHeight: 251),
          SizedBox(height: 63),
        ],
      ),
    );
  }
}
