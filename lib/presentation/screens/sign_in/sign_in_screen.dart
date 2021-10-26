part of sign_in;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoAppBar(
        title: CupertinoTextButton(
          label: AppLocalization.textCancel,
          onPressed: () => Navigator.pop(context),
          style: Theme.of(context).textTheme.subtitle1!,
          padding: EdgeInsets.symmetric(vertical: 13),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppInsets.insetsPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            const LoginTitle(label: AppLocalization.textSignIn),
            const SizedBox(height: 57),
            const LoginTextField(
              hintText: AppLocalization.textEmail,
              iconAsset: AppAssets.iconMail,
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textPassword,
              iconAsset: AppAssets.iconEye,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoTextButton(
                label: AppLocalization.textForgotLoginOrPassword,
                style: Theme.of(context).textTheme.caption!,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 50),
            CupertinoTextButton(
              label: AppLocalization.textSignIn,
              isFilled: true,
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
              style: Theme.of(context).primaryTextTheme.button!.copyWith(
                    fontSize: 17,
                  ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.home, (Route<dynamic> route) => false),
            ),
            const SizedBox(height: 10),
            CupertinoTextButton(
              label: AppLocalization.textSignUp,
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
