part of welcome;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                style: theme.textTheme.headline1,
              ),
            ),
            Button(
              label: AppLocalization.textCreateAnAccount,
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.signUp,
              ),
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
