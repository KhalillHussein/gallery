part of sign_up;

class Form extends StatelessWidget {
  const Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context
        .select<SignUpCubit, bool>((value) => value.state.status.isLoading);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100),
        const LoginTitle(label: AppLocalization.textSignUp),
        const SizedBox(height: 57),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue: state.userName.value,
              hintText: AppLocalization.textUserName,
              iconAsset: AppAssets.iconUser,
              isRequired: true,
              onChanged: context.read<ValidateSignUpCubit>().userNameChanged,
              errorText: state.userName.invalid
                  ? AppLocalization.textUserNameInvalid
                  : null,
            );
          },
        ),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return LoginTextField(
            initialValue: state.birthday.value,
            hintText: AppLocalization.textBirthDay,
            iconAsset: AppAssets.iconCalendar,
            fieldType: TextFieldType.date,
            onChanged: context.read<ValidateSignUpCubit>().birthdayChanged,
            errorText: state.birthday.invalid
                ? AppLocalization.textBirthdayInvalid
                : null,
          );
        }),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue: state.email.value,
              hintText: AppLocalization.textEmail,
              iconAsset: AppAssets.iconMail,
              isRequired: true,
              onChanged: context.read<ValidateSignUpCubit>().emailChanged,
              fieldType: TextFieldType.email,
              errorText:
                  state.email.invalid ? AppLocalization.textEmailInvalid : null,
            );
          },
        ),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return LoginTextField(
            initialValue: state.password.value,
            hintText: AppLocalization.textOldPassword,
            iconAsset: AppAssets.iconEye,
            isRequired: true,
            fieldType: TextFieldType.password,
            onChanged: context.read<ValidateSignUpCubit>().passwordChanged,
            errorText: state.password.invalid
                ? AppLocalization.textPasswordInvalid
                : null,
          );
        }),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return LoginTextField(
            initialValue: state.confirmPassword.value,
            hintText: AppLocalization.textConfirmPassword,
            iconAsset: AppAssets.iconEye,
            isRequired: true,
            fieldType: TextFieldType.password,
            onChanged:
                context.read<ValidateSignUpCubit>().confirmPasswordChanged,
            errorText: state.confirmPassword.invalid
                ? AppLocalization.textConfirmPasswordInvalid
                : null,
          );
        }),
        const SizedBox(height: 50),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return context.select<SignUpCubit, bool>(
                  (value) => value.state.status.isLoading)
              ? CircularProgressIndicator(strokeWidth: 1)
              : CupertinoTextButton(
                  label: AppLocalization.textSignUp,
                  isFilled: true,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
                  style: Theme.of(context).primaryTextTheme.button!.copyWith(
                        fontSize: 17,
                      ),
                  onPressed: state.status.isValid || !isLoading
                      ? () =>
                          context.read<SignUpCubit>().loadData(SignUpApiQuery(
                                email: state.email.value,
                                password: state.password.value,
                                username: state.userName.value,
                                birthday: state.birthday.value,
                              ).toMap())
                      : () {},
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
        const SizedBox(height: 29),
        Text(
          context.select<SignUpCubit, String>(
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
