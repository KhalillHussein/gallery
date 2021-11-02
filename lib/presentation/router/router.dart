part of router;

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Map<String, dynamic>? args =
        settings.arguments as Map<String, dynamic>?;
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
      case AppRoutes.start:
        return MaterialPageRoute<SignInScreen>(
          builder: (_) => StartScreen(),
        );
      case AppRoutes.settings:
        return MaterialPageRoute<SettingsScreen>(
          builder: (_) => SettingsScreen(),
        );
      case AppRoutes.photoUpload:
        final imageFile = args!['file'] as XFile;
        return MaterialPageRoute<PhotoUploadScreen>(
          builder: (_) => PhotoUploadScreen(
            imageFile: imageFile,
          ),
        );
      case AppRoutes.photoDetail:
        final photo = args!['photo'] as Photo;
        return MaterialPageRoute<PhotoDetailScreen>(
          builder: (_) => PhotoDetailScreen(photo: photo),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
