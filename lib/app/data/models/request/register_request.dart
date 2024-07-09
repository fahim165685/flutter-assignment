import 'dart:convert';


String registerRequestToMap(RegisterRequest data) => json.encode(data.toMap());

class RegisterRequest {
  final int userType;
  final String email;
  final String password;

  RegisterRequest({
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
