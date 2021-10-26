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
            BlocBuilder<ValidateCubit, ValidateState>(
              builder: (context, state) {
                return LoginTextField(
                  hintText: AppLocalization.textUserName,
                  iconAsset: AppAssets.iconUser,
                  isRequired: true,
                  onChanged: context.read<ValidateCubit>().userNameChanged,
                  errorText: state.userName.invalid
                      ? AppLocalization.textUserNameInvalid
                      : null,
                );
              },
            ),
            const SizedBox(height: 29),
            const LoginTextField(
              hintText: AppLocalization.textBirthDay,
              iconAsset: AppAssets.iconCalendar,
              fieldType: TextFieldType.date,
            ),
            const SizedBox(height: 29),
            BlocBuilder<ValidateCubit, ValidateState>(
              builder: (context, state) {
                return LoginTextField(
                  hintText: AppLocalization.textEmail,
                  iconAsset: AppAssets.iconMail,
                  isRequired: true,
                  onChanged: context.read<ValidateCubit>().emailChanged,
                  fieldType: TextFieldType.email,
                  errorText: state.email.invalid
                      ? AppLocalization.textEmailInvalid
                      : null,
                );
              },
            ),
            const SizedBox(height: 29),
            BlocBuilder<ValidateCubit, ValidateState>(
                builder: (context, state) {
              return LoginTextField(
                hintText: AppLocalization.textOldPassword,
                iconAsset: AppAssets.iconEye,
                isRequired: true,
                fieldType: TextFieldType.password,
                onChanged: context.read<ValidateCubit>().passwordChanged,
                errorText: state.password.invalid
                    ? AppLocalization.textPasswordInvalid
                    : null,
              );
            }),
            const SizedBox(height: 29),
            BlocBuilder<ValidateCubit, ValidateState>(
                builder: (context, state) {
              return LoginTextField(
                hintText: AppLocalization.textConfirmPassword,
                iconAsset: AppAssets.iconEye,
                isRequired: true,
                fieldType: TextFieldType.password,
                onChanged: context.read<ValidateCubit>().confirmPasswordChanged,
                errorText: state.confirmPassword.invalid
                    ? AppLocalization.textPasswordInvalid
                    : null,
              );
            }),
            const SizedBox(height: 50),
            BlocBuilder<ValidateCubit, ValidateState>(
                builder: (context, state) {
              return CupertinoTextButton(
                label: AppLocalization.textSignUp,
                isFilled: true,
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
                style: Theme.of(context).primaryTextTheme.button!.copyWith(
                      fontSize: 17,
                    ),

                ///TODO: CONTINUE
                onPressed: () {},
                // onPressed: state.status.isValid
                //     // ? () => context.read<AuthCubit>().loadData(SignUpApiQuery(email:state.email.value,password: state.password.value,username: state.userName.value,birthday: state. ))
                //     : () {},
              );
            }),
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
