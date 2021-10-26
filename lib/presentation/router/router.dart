part of router;

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute<WelcomeScreen>(
          builder: (_) => WelcomeScreen(),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute<SignInScreen>(
          builder: (_) => SignInScreen(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute<SignInScreen>(
          builder: (_) => SignUpScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute<SignInScreen>(
          builder: (_) => HomeScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
