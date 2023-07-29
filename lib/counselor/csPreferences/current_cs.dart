import 'package:get/get.dart';
import '../csPreferences/cs_prefs.dart';
import'../cs_model/cs.dart';

class CurrentCounselor extends GetxController
{
  Rx<Counselor> _currentCounselor = Counselor('','','','').obs;

  Counselor get counselor => _currentCounselor.value;

  getCounselorInfo() async 
  {
    Counselor? getCounselorInfoFromLocalStorage = await RememberCounselorPrefs.readCounselorInfo();
    _currentCounselor.value =  getCounselorInfoFromLocalStorage!;
  }
}