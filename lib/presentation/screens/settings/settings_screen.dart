part of settings;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              CupertinoTextButton(
                label: AppLocalization.textCancel,
                onPressed: () => Navigator.pop(context),
                style: Theme.of(context).textTheme.subtitle1!,
              ),
              CupertinoTextButton(
                label: AppLocalization.textSave,
                onPressed: () => Navigator.pop(context),
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppInsets.insetsPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 21),
            Center(child: Avatar()),
            const SizedBox(height: 10),
            Center(
              child: Text(
                AppLocalization.textUploadPhoto,
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            Form(),
            const SizedBox(height: 39),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalization.textYouCanDeleteYourAccount
                        .split(' ')
                        .getRange(0, 2)
                        .join(' '),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  TextSpan(
                    text: ' ',
                  ),
                  WidgetSpan(
                    child: CupertinoTextButton(
                      label: AppLocalization.textYouCanDeleteYourAccount
                          .split(' ')
                          .getRange(2, 5)
                          .join(' '),
                      onPressed: () {},
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CupertinoTextButton(
              label: AppLocalization.textSignOut,
              onPressed: () {},
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
