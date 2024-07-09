import 'dart:convert';

String loginRequestToMap(LoginRequest data) => json.encode(data.toMap());

class LoginRequest {
  final int userType;
  final String email;
  final String password;

  LoginRequest({
    required this.userType,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
    "user_type": userType,
    "email": email,
    "password": password,
  };
}
