part of photo_upload;

class PhotoUploadScreen extends StatefulWidget {
  const PhotoUploadScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final XFile imageFile;

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

  @override
  void dispose() {
    _nameEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }

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
                onPressed: () {
                  context.read<UploadPhotoCubit>().loadData(
                        PhotoUploadApiQuery(
                                file: File(widget.imageFile.path),
                                name: _nameEditingController.text,
                                description: _descriptionEditingController.text)
                            .toMap(),
                      );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 62),
                    child: Image.file(
                      File(widget.imageFile.path),
                      fit: BoxFit.cover,
                      height: 251,
                      width: double.infinity,
                    ),
                  ),
                  Spacer(),
                  BottomBar(
                    nameEditingController: _nameEditingController,
                    descriptionEditingController: _descriptionEditingController,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        SvgPicture.asset(AppAssets.iconInfo),
        const SizedBox(width: 15),
        const Text(
          AppLocalization.textPublicationHasBeenModerated,
        ),
      ],
    ),
  );
}
