class Url {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Url._();

  static const String baseUrl = 'http://gallery.dev.webant.ru';

  ///URL for sign up
  static const String signUp = '$baseUrl/api/users';

  ///URL to fetch photos
  static const String photos = '$baseUrl/api/photos';

  ///URL for sign in
  static const String signIn = '$baseUrl/oauth/v2/token';
}
