class Url {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Url._();

  static const String baseUrl = 'http://gallery.dev.webant.ru';

  ///URL for sign in & refresh token
  static const String token = '$baseUrl/oauth/v2/token';

  ///URL to get image path
  static const String media = '$baseUrl/media';

  //API URL
  static const String api = '$baseUrl/api';

  ///URL for creating client resource
  static const String clients = '$api/clients';

  ///URL for sign up
  static const String signUp = '$api/users';

  ///URL to get current user
  static const String currentUser = '$api/users/current';

  ///URL to fetch photos
  static const String photos = '$api/photos';

  ///URL to fetch media object
  static const String mediaObject = '$api/media_objects';
}
