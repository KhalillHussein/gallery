part of sign_in;

class Form extends StatelessWidget {
  const Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100),
        const LoginTitle(label: AppLocalization.textSignIn),
        const SizedBox(height: 57),
        BlocBuilder<ValidateCubit, ValidateState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue: state.email.value,
              hintText: AppLocalization.textEmail,
              iconAsset: AppAssets.iconMail,
              onChanged: context.read<ValidateCubit>().emailChanged,
              fieldType: TextFieldType.email,
              errorText:
                  state.email.invalid ? AppLocalization.textEmailInvalid : null,
            );
          },
        ),
        const SizedBox(height: 29),
        BlocBuilder<ValidateCubit, ValidateState>(builder: (context, state) {
          return LoginTextField(
            initialValue: state.password.value,
            hintText: AppLocalization.textPassword,
            iconAsset: AppAssets.iconEye,
            fieldType: TextFieldType.password,
            onChanged: context.read<ValidateCubit>().passwordChanged,
            errorText: state.password.invalid
                ? AppLocalization.textPasswordInvalid
                : null,
          );
        }),
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
    );
  }
}
