import 'dart:convert';

SocialLoginRequest socialLoginRequestFromMap(dynamic str) => SocialLoginRequest.fromMap(str);

String socialLoginRequestToMap(SocialLoginRequest data) => json.encode(data.toMap());

class SocialLoginRequest {
  final String socialType;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String accessToken;

  SocialLoginRequest({
    required this.socialType,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.accessToken,
  });

  factory SocialLoginRequest.fromMap(Map<String, dynamic> json) => SocialLoginRequest(
    socialType: json["social_type"],
    fName: json["f_name"],
    lName: json["l_name"],
    email: json["email"],
    phone: json["phone"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toMap() => {
    "social_type": socialType,
    "f_name": fName,
    "l_name": lName,
    "email": email,
    "phone": phone,
    "access_token": accessToken,
  };
}
