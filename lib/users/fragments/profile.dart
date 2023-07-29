import 'package:flutter/material.dart';
import 'package:msq_mysql/users/authentication/login_screen.dart';
import 'package:msq_mysql/users/userPreferences/current_user.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/users/userPreferences/user_prefs.dart';

class ProfileFragment extends StatelessWidget {

  final CurrentUser _currentUser = Get.put(CurrentUser());

  ProfileFragment({super.key});

  signOutUser() async{
    
    var resultResponse = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Log Out",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        content: const Text(
          "Are you sure?",
        ),

        actions: [
          TextButton(
            onPressed: (){
              Get.back();
            },
            
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                ),
            ),
            ),

          TextButton(
            onPressed: (){
              Get.back(result: "loggedOut");
            },
            
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            ),  
        ],
      ),
    );

    if(resultResponse == "loggedOut")
    {
      // delete/remove user data from local storage
      RememberUserPrefs.removeUserInfo()
        .then((value)
        {
          Get.off(() => const LoginScreen());
        });
    }
  }
  
  Widget userInfoItemProfile(IconData iconData, String userData){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade400,
      ),

      

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),

          const SizedBox(width: 16),

          Text(
            userData,
            style: const TextStyle(
              fontSize: 15
            ),
          ),
        ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        const SizedBox(height: 30),
        
        Center(
          child: Image.asset("lib/images/man.png",
          width: 240,
          height: 180,
          ),
        ),
        
        const SizedBox(height: 30),

        userInfoItemProfile(Icons.work, _currentUser.user.staff_no),

        const SizedBox(height: 20),

        userInfoItemProfile(Icons.person, _currentUser.user.user_name),

        const SizedBox(height: 20),

        userInfoItemProfile(Icons.email, _currentUser.user.user_email),

        const SizedBox(height: 20),

        userInfoItemProfile(Icons.phone_iphone, _currentUser.user.phone_no),

        const SizedBox(height: 30),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: (){
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),

                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ),
          ),
        )


      ],
    );
  }
}