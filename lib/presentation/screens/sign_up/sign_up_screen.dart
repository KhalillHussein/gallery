part of sign_up;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
            const LoginTitle(label: AppLocalization.textSignUp),
            const SizedBox(height: 57),
            const LoginTextField(
              hintText: AppLocalization.textUserName,
              iconAsset: AppAssets.iconUser,
              isRequired: true,
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textBirthDay,
              iconAsset: AppAssets.iconCalendar,
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textEmail,
              iconAsset: AppAssets.iconMail,
              isRequired: true,
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textOldPassword,
              iconAsset: AppAssets.iconEye,
              isRequired: true,
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textConfirmPassword,
              iconAsset: AppAssets.iconEye,
              isRequired: true,
            ),
            const SizedBox(height: 50),
            CupertinoTextButton(
              label: AppLocalization.textSignUp,
              isFilled: true,
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
              style: Theme.of(context).primaryTextTheme.button!.copyWith(
                    fontSize: 17,
                  ),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            CupertinoTextButton(
              label: AppLocalization.textSignIn,
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
