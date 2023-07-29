// ignore_for_file: non_constant_identifier_names

class Hr
{
  String hr_no;
  String hr_name;
  String hr_email;
  String hr_password;

  Hr(
    this.hr_no,
    this.hr_name,
    this.hr_email,
    this.hr_password,
  );

  factory Hr.fromJson(Map<String, dynamic> json) => Hr(
      json["hr_no"],
      json["hr_name"],
      json["hr_email"],
      json["hr_password"],
    );

  Map<String, dynamic> toJson() => 
  {
    'hr_no': hr_no,
    'hr_name': hr_name,
    'hr_email': hr_email,
    'hr_password': hr_password,
  };
}