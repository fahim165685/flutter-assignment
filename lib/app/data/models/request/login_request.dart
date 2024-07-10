import 'dart:convert';

String loginRequestToMap(LoginRequest data) => json.encode(data.toMap());

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
    "email": email,
    "password": password,
  };
}
