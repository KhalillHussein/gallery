//Model class to storage auth form data
class SignUpApiQuery {
  final String? email;
  final String? password;
  final String? username;
  final String? birthday;

  const SignUpApiQuery({
    this.email,
    this.password,
    this.username,
    this.birthday,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'birthday': birthday,
    };
  }
}
