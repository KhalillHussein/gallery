part of settings;

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalization.textPersonalData,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 20),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue:
                  context.read<AuthenticationCubit>().state.user!.username!,
              hintText: AppLocalization.textUserName,
              iconAsset: AppAssets.iconUser,
              textInputAction: TextInputAction.next,
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
            initialValue: context
                .read<AuthenticationCubit>()
                .state
                .user!
                .formattedFormData,
            hintText: AppLocalization.textBirthDay,
            iconAsset: AppAssets.iconCalendar,
            fieldType: TextFieldType.date,
            textInputAction: TextInputAction.next,
            onChanged: context.read<ValidateSignUpCubit>().birthdayChanged,
            errorText: state.birthday.invalid
                ? AppLocalization.textBirthdayInvalid
                : null,
          );
        }),
        const SizedBox(height: 39),
        Text(
          AppLocalization.textEmailAddress,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 20),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
          builder: (context, state) {
            return LoginTextField(
              initialValue:
                  context.read<AuthenticationCubit>().state.user!.email!,
              hintText: AppLocalization.textEmail,
              iconAsset: AppAssets.iconMail,
              textInputAction: TextInputAction.next,
              onChanged: context.read<ValidateSignUpCubit>().emailChanged,
              fieldType: TextFieldType.email,
              errorText:
                  state.email.invalid ? AppLocalization.textEmailInvalid : null,
            );
          },
        ),
        const SizedBox(height: 39),
        Text(
          AppLocalization.textPassword,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 20),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return LoginTextField(
            hintText: AppLocalization.textOldPassword,
            iconAsset: AppAssets.iconEye,
            fieldType: TextFieldType.password,
            textInputAction: TextInputAction.next,
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
            hintText: AppLocalization.textNewPassword,
            iconAsset: AppAssets.iconEye,
            fieldType: TextFieldType.password,
            textInputAction: TextInputAction.next,
            onChanged:
                context.read<ValidateSignUpCubit>().confirmPasswordChanged,
            errorText: state.confirmPassword.invalid
                ? AppLocalization.textConfirmPasswordInvalid
                : null,
          );
        }),
        const SizedBox(height: 29),
        BlocBuilder<ValidateSignUpCubit, ValidateSignUpState>(
            builder: (context, state) {
          return LoginTextField(
            hintText: AppLocalization.textConfirmPassword,
            iconAsset: AppAssets.iconEye,
            fieldType: TextFieldType.password,
            onChanged:
                context.read<ValidateSignUpCubit>().confirmPasswordChanged,
            errorText: state.confirmPassword.invalid
                ? AppLocalization.textConfirmPasswordInvalid
                : null,
          );
        }),
      ],
    );
  }
}
