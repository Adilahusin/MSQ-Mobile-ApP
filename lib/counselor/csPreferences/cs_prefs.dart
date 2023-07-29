import 'dart:convert';
import'../cs_model/cs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberCounselorPrefs
{
  // save/remember counselorInfo
  static Future<void> storeCounselorInfo(Counselor counselorInfo) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String counselorJsonData = jsonEncode(counselorInfo.toJson());
    await preferences.setString("currentCounselor", counselorJsonData);
  }

  // get/read counselorInfo
  static Future<Counselor?> readCounselorInfo() async
  {
    Counselor? currentCounselorInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? counselorInfo = preferences.getString("currentCounselor");
    if(counselorInfo != null)
    {
      Map<String, dynamic> counselorDataMap = jsonDecode(counselorInfo);
      currentCounselorInfo = Counselor.fromJson(counselorDataMap);
    }
    return currentCounselorInfo;
  }

  static Future<void> removeCounselorInfo() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentCounselor");
  }

}