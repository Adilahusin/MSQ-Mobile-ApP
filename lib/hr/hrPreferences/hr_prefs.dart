import 'dart:convert';
import'../hr_model/hr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberHrPrefs
{
  // save/remember hrInfo
  static Future<void> storeHrInfo(Hr hrInfo) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String hrJsonData = jsonEncode(hrInfo.toJson());
    await preferences.setString("currentHr", hrJsonData);
  }

  // get/read hrInfo
  static Future<Hr?> readHrInfo() async
  {
    Hr? currentHrInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? hrInfo = preferences.getString("currentHr");
    if(hrInfo != null)
    {
      Map<String, dynamic> hrDataMap = jsonDecode(hrInfo);
      currentHrInfo = Hr.fromJson(hrDataMap);
    }
    return currentHrInfo;
  }

  static Future<void> removeHrInfo() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentHr");
  }

}