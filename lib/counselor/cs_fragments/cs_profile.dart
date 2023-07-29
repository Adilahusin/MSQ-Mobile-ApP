import 'package:flutter/material.dart';
import 'package:msq_mysql/counselor/cs_authentication/cslogin_screen.dart';
import 'package:msq_mysql/counselor/csPreferences/current_cs.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/counselor/csPreferences/cs_prefs.dart';

class CsProfileFragment extends StatelessWidget {

  final CurrentCounselor _currentCounselor = Get.put(CurrentCounselor());

  CsProfileFragment({super.key});

  signOutCounselor() async{
    
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
      // delete/remove Counselor data from local storage
      RememberCounselorPrefs.removeCounselorInfo()
        .then((value)
        {
          Get.off(() => const CounselorLogin());
        });
    }
  }
  
  Widget counselorInfoItemProfile(IconData iconData, String counselorData){
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
            counselorData,
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

        counselorInfoItemProfile(Icons.work, _currentCounselor.counselor.cs_no),

        const SizedBox(height: 20),

        counselorInfoItemProfile(Icons.person, _currentCounselor.counselor.cs_name),

        const SizedBox(height: 20),

        counselorInfoItemProfile(Icons.email, _currentCounselor.counselor.cs_email),

        const SizedBox(height: 30),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: (){
                signOutCounselor();
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