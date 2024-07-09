
UserResponse signInResponseFromMap(dynamic str) => UserResponse.fromMap(str);

class UserResponse {
  bool? success;
  Data? data;
  String? tokenType;
  String? token;

  UserResponse({
    this.success,
    this.data,
    this.tokenType,
    this.token,
  });

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
    tokenType: json["token_type"],
    token: json["token"],
  );
}

class Data {
  User? user;
  Data({
    this.user,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromMap(json["user"]),
  );
}

class User {
  String? fName;
  String? lName;
  String? email;
  String? phone;
  String? userType;
  String? isCompleteProfile;
  String? status;
  dynamic rejectedDate;

  User({
    this.fName,
    this.lName,
    this.email,
    this.phone,
    this.userType,
    this.isCompleteProfile,
    this.status,
    this.rejectedDate,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    fName: json["f_name"],
    lName: json["l_name"],
    email: json["email"],
    phone: json["phone"],
    userType: json["user_type"],
    isCompleteProfile: json["is_complete_profile"],
    status: json["status"],
    rejectedDate: json["rejected_date"],
  );
}
