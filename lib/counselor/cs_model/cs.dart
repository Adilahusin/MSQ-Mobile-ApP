// ignore_for_file: non_constant_identifier_names

class Counselor
{
  String cs_no;
  String cs_name;
  String cs_email;
  String cs_password;

  Counselor(
    this.cs_no,
    this.cs_name,
    this.cs_email,
    this.cs_password,
  );

  factory Counselor.fromJson(Map<String, dynamic> json) => Counselor(
      json["cs_no"],
      json["cs_name"],
      json["cs_email"],
      json["cs_password"],
    );

  Map<String, dynamic> toJson() => 
  {
    'cs_no': cs_no,
    'cs_name': cs_name,
    'cs_email': cs_email,
    'cs_password': cs_password,
  };
}