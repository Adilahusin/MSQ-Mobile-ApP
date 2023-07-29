class API 
{
  static const hostConnect = "http://10.30.3.6/api_msq_app";
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectCounselor = "$hostConnect/counselor";

  // signUp user
  static const validateStaffNo = "$hostConnect/user/validate_staffNo.php";
  static const signUp = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";

  // counselor
  static const cslogin = "$hostConnect/counselor/cslogin.php";
  static const validateCsNo = "$hostConnect/counselor/validate_csNo.php";

  // counselor
  static const hrlogin = "$hostConnect/hr/hrlogin.php";
  static const validateHrNo = "$hostConnect/hr/validate_hrNo.php";

  //view Questions
  static const viewQuestions = "$hostConnect/viewQuestions.php";
}