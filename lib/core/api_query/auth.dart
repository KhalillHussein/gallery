//Model class to storage auth form data
class AuthApiQuery {
  final String? login;
  final String? password;

  const AuthApiQuery({
    this.login,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }
}
