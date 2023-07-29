import 'package:get/get.dart';
import '../hrPreferences/hr_prefs.dart';
import'../hr_model/hr.dart';

class CurrentHr extends GetxController
{
  Rx<Hr> _currentHr = Hr('','','','').obs;

  Hr get hr => _currentHr.value;

  getHrInfo() async 
  {
    Hr? getHrInfoFromLocalStorage = await RememberHrPrefs.readHrInfo();
    _currentHr.value =  getHrInfoFromLocalStorage!;
  }
}