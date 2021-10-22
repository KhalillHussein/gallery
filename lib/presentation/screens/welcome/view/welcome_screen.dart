part of welcome;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppInsets.insetsPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                AppLocalization.textWelcome,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Button(
              label: AppLocalization.textCreateAnAccount,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Button(
              label: AppLocalization.textAlreadyHaveAnAccount,
              isOutline: true,
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.signIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
