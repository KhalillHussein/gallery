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
        child: RequestBuilder<SignUpCubit, User>(
          onInit: (context, state) => Form(),
          onError: (context, state, value) => Form(),
          onLoading: (context, state, value) => Loading(),
          onListen: (context, state) {
            if (state.status.isSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.home, (Route<dynamic> route) => false);
            }
          },
        ),
      ),
    );
  }
}
