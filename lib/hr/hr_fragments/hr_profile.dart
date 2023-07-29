import 'package:flutter/material.dart';
import '../hrPreferences/current_hr.dart';
import '../hr_authetication/hrlogin_screen.dart';
import '../hrPreferences/hr_prefs.dart';
import 'package:get/get.dart';

class HrProfileFragment extends StatelessWidget {

  final CurrentHr _currentHr = Get.put(CurrentHr());

  HrProfileFragment({super.key});

  signOutHr() async{
    
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
      // delete/remove Hr data from local storage
      RememberHrPrefs.removeHrInfo()
        .then((value)
        {
          Get.off(() => const HrLogin());
        });
    }
  }
  
  Widget hrInfoItemProfile(IconData iconData, String hrData){
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
            hrData,
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

        hrInfoItemProfile(Icons.work, _currentHr.hr.hr_no),

        const SizedBox(height: 20),

        hrInfoItemProfile(Icons.person, _currentHr.hr.hr_name),

        const SizedBox(height: 20),

        hrInfoItemProfile(Icons.email, _currentHr.hr.hr_email),

        const SizedBox(height: 30),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: (){
                signOutHr();
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