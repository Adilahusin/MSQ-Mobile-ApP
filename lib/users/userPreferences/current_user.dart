import 'package:get/get.dart';
import 'package:msq_mysql/users/userPreferences/user_prefs.dart';
import '../model/user.dart';

class CurrentUser extends GetxController
{
  final Rx<User> _currentUser = User('','','','','').obs;

  User get user => _currentUser.value;

  getUserInfo() async 
  {
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value =  getUserInfoFromLocalStorage!;
  }
}