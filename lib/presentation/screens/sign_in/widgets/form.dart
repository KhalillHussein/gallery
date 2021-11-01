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
        BlocBuilder<ValidateSignInCubit, ValidateSignInState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue: state.userName.value,
              hintText: AppLocalization.textUserName,
              iconAsset: AppAssets.iconUser,
              onChanged: context.read<ValidateSignInCubit>().userNameChanged,
              fieldType: TextFieldType.email,
              errorText: state.userName.invalid
                  ? AppLocalization.textUserNameInvalid
                  : null,
            );
          },
        ),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignInCubit, ValidateSignInState>(
            builder: (context, state) {
          return LoginTextField(
            initialValue: state.password.value,
            hintText: AppLocalization.textPassword,
            iconAsset: AppAssets.iconEye,
            fieldType: TextFieldType.password,
            onChanged: context.read<ValidateSignInCubit>().passwordChanged,
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
        BlocBuilder<ValidateSignInCubit, ValidateSignInState>(
            builder: (context, state) {
          return context.select<SignInCubit, bool>(
                  (value) => value.state.status.isLoading)
              ? CircularProgressIndicator()
              : CupertinoTextButton(
                  label: AppLocalization.textSignIn,
                  isFilled: true,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
                  style: Theme.of(context).primaryTextTheme.button!.copyWith(
                        fontSize: 17,
                      ),
                  onPressed: state.status.isValid
                      ? () =>
                          context.read<SignInCubit>().loadData(SignInApiQuery(
                                password: state.password.value,
                                username: state.userName.value,
                              ).toMap())
                      : () {},
                );
        }),
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
        const SizedBox(height: 29),
        Text(
          context.select<SignInCubit, String>(
              (value) => value.state.errorMessage ?? ''),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption!.copyWith(
                height: 1.3,
                color: AppColors.colorRed,
              ),
        ),
      ],
    );
  }
}
