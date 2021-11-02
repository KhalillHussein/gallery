part of photo_upload;

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.nameEditingController,
    required this.descriptionEditingController,
  }) : super(key: key);

  final TextEditingController nameEditingController;
  final TextEditingController descriptionEditingController;

  @override
  Widget build(BuildContext context) {
    return Material(
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
                controller: nameEditingController,
                placeholder: AppLocalization.textName,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
                ),
              ),
            ),
            CupertinoTextField(
              controller: descriptionEditingController,
              placeholder: AppLocalization.textDescription,
              maxLines: 5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(AppInsets.insetsRadius),
              ),
            ),
            const SizedBox(height: 119)
          ],
        ),
      ),
    );
  }
}
