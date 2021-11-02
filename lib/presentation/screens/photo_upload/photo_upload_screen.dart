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
                  context.read<UploadPhotoCubit>().loadData({
                    'file': File(widget.imageFile.path),
                    'name': _nameEditingController.text,
                    'description': _descriptionEditingController.text,
                  });
                  Navigator.pop(context);
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
                  Material(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppInsets.insetsPadding,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CupertinoTextField(
                              controller: _nameEditingController,
                              placeholder: AppLocalization.textName,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                    AppInsets.insetsRadius),
                              ),
                            ),
                          ),
                          CupertinoTextField(
                            controller: _descriptionEditingController,
                            placeholder: AppLocalization.textDescription,
                            maxLines: 5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                              borderRadius:
                                  BorderRadius.circular(AppInsets.insetsRadius),
                            ),
                          ),
                          const SizedBox(height: 119)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
