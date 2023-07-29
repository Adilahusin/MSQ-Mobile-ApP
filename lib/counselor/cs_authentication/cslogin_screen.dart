import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msq_mysql/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msq_mysql/counselor/cs_fragments/cs_dashboard.dart';
import 'dart:convert';
import '../../hr/hr_authetication/hrlogin_screen.dart';
import '../../users/authentication/login_screen.dart';
import '../cs_model/cs.dart';
import '../csPreferences/cs_prefs.dart';

class CounselorLogin extends StatefulWidget {
  const CounselorLogin({super.key});


  @override
  State<CounselorLogin> createState() => _CounselorLoginState();
}

class _CounselorLoginState extends State<CounselorLogin> {

  var formKey = GlobalKey<FormState>();
  var csNoController = TextEditingController();
  var csPasswordController = TextEditingController();
  var isObsecure = true.obs;

  loginCsNow() async 
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.cslogin),
        body: {
          "cs_no": csNoController.text.trim(),
          "cs_password": csPasswordController.text.trim(),
        },
      );

      if(res.statusCode == 200)
      {
        var resBodyOfLogin = jsonDecode(res.body);
        
        if(resBodyOfLogin['success'] == true)
        {
          Fluttertoast.showToast(msg: "Login successful.");

          Counselor counselorInfo = Counselor.fromJson(resBodyOfLogin["userCsData"]);

          // save counselorInfo to local storage using Shared Preferences
          await RememberCounselorPrefs.storeCounselorInfo(counselorInfo);

          Future.delayed(const Duration(milliseconds: 2000), ()
          {
            Get.to(() => const CsDashboard());
          }
          );

        }
        else
        {
          Fluttertoast.showToast(msg: "Incorrect credentials.\nPlease try again.");
        }
      }
    }

    catch(errorMsg)
    {
      debugPrint("Error :: $errorMsg");
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.lightGreen.shade200,

        actions: <Widget>[
          IconButton(icon: Image.asset('lib/images/tati.png'),
          onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => const TatiInfo()));
            },
          ),

        ],
      ),
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            
            child: SingleChildScrollView(
              child: Column(
                children: [

                const Text(
                  "MSQ Mobile App",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  ),
                ),

                const SizedBox(height: 20),
                    
                Text(
                  "Minnesota Satisfaction Questionnaire (Admin)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                  // login screen sign in form
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  // cs no login
                                  TextFormField(
                                    controller: csNoController,
                                    validator: (val) => val == " " ? "Please write staff no." : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.work,
                                        color: Colors.black,
                                      ),
                                      hintText: "Counselor No.",
                                      
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),

                                      fillColor: Colors.white,
                                      filled: true,

                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  // password login
                                  Obx(
                                    () => TextFormField(
                                    controller: csPasswordController,
                                    obscureText: isObsecure.value,
                                    validator: (val) => val == " " ? "Please write password" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.vpn_key_sharp,
                                        color: Colors.black,
                                      ),
                                      
                                      suffixIcon: Obx(
                                        ()=> GestureDetector(
                                          onTap: (){
                                            isObsecure.value =! isObsecure.value;
                                          },

                                          child: Icon(
                                            isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      hintText: "Password",
                                      
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),

                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),

                                      fillColor: Colors.white,
                                      filled: true,

                                    ),
                                  ),
                                  ),

                                  const SizedBox(height: 18),

                                  // button
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {
                                          loginCsNow();
                                        }
                                      },

                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 28,
                                          vertical: 10,
                                        ),

                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),

                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),

                            const SizedBox(height: 10),

                            // If you are user
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Are you a User?",
                                ),

                                TextButton(
                                  onPressed: (){
                                    Get.to(() => const LoginScreen());  
                                  },
                                  child: Text(
                                    "Click Here",
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ),
                              ],
                            ),

                            // If you are hr
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Are you a HR Staff?",
                                ),

                                TextButton(
                                  onPressed: (){
                                    Get.to(() => const HrLogin());  
                                  },
                                  child: Text(
                                    "Click Here",
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ),
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),
                  ),

                  //login screen header
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Image.asset("lib/images/1.png"),
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
    
  }
}