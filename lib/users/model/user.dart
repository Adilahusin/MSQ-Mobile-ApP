// ignore_for_file: non_constant_identifier_names

class User
{
  String staff_no;
  String user_name;
  String user_email;
  String user_password;
  String phone_no;

  User(
    this.staff_no,
    this.user_name,
    this.user_email,
    this.user_password,
    this.phone_no,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
      json["staff_no"],
      json["user_name"],
      json["user_email"],
      json["user_password"],
      json["phone_no"],
    );

  Map<String, dynamic> toJson() => 
  {
    'staff_no': staff_no,
    'user_name': user_name,
    'user_email': user_email,
    'user_password': user_password,
    'phone_no': phone_no,
  };
}