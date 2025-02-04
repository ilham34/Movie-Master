class SignInReqParams {
  final String email;
  final String password;

  SignInReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };
}
