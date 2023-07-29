import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/users/authentication/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:msq_mysql/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msq_mysql/users/fragments/dashboard.dart';
import 'dart:convert';
import 'package:msq_mysql/users/model/user.dart';
import 'package:msq_mysql/users/userPreferences/user_prefs.dart';
import '../../counselor/cs_authentication/cslogin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var staffNoController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  loginUserNow() async 
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "staff_no": staffNoController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if(res.statusCode == 200)
      {
        var resBodyOfLogin = jsonDecode(res.body);
        
        if(resBodyOfLogin['success'] == true)
        {
          Fluttertoast.showToast(msg: "Login successful.");
          
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          // save userInfo to local storage using Shared Preferences
          await RememberUserPrefs.storeUserInfo(userInfo);

          Future.delayed(const Duration(milliseconds: 1000), ()
          {
            Get.to(() => const DashboardOfFragments());
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
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue.shade100,

        actions: <Widget>[
          IconButton(icon: Image.asset('lib/images/tati.png'),
          onPressed: () {
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
                  "Minnesota Satisfaction Questionnaire",
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

                                  // staff no login
                                  TextFormField(
                                    controller: staffNoController,
                                    validator: (val) => val == " " ? "Please write staff no." : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.work,
                                        color: Colors.black,
                                      ),
                                      hintText: "Staff No.",
                                      
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
                                    controller: passwordController,
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
                                          loginUserNow();
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

                            // Don't have account and register here
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an Account?",
                                ),

                                TextButton(
                                  onPressed: (){
                                    Get.to(() => const SignUpScreen());  
                                  },
                                  child: Text(
                                    "Register Here",
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ),
                              ],
                            ),

                            // If you are Admin
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Are you an Admin?",
                                ),

                                TextButton(
                                  onPressed: (){
                                    Get.to(() => const CounselorLogin());  
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