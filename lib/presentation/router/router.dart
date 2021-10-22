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
      default:
        throw const RouteException('Route not found!');
    }
  }
}
