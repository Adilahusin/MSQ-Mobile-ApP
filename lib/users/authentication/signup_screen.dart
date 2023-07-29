import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:msq_mysql/api_connection/api_connection.dart';
import 'package:msq_mysql/users/authentication/login_screen.dart';
import 'package:msq_mysql/users/model/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var formKey = GlobalKey<FormState>();
  var staffNoController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNoController = TextEditingController();
  var isObsecure = true.obs;
  
  validateUserStaffNo() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.validateStaffNo),
        body: {
          'staff_no': staffNoController.text.trim(),
        },
      );

      // statusCode == 200 means connection with API to server - SUCCESS
      if (res.statusCode == 200)
      {
        var resBodyOfValidateStaffNo = jsonDecode(res.body);

        if(resBodyOfValidateStaffNo['staffnoFound'] == true)
        {
          Fluttertoast.showToast(
            msg: "Staff No. is already in use. Please try another Staff No.");
        }
        
        else{
          // register and save new record to database
          registerAndSaveUserRecord();
        }
      }

    }
    catch(e)
    {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async
  {
    User userModel = User(
      staffNoController.text.trim(), 
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
      phoneNoController.text.trim(), 
    );

    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200)
      {
        var resBodyOfSignUp = jsonDecode(res.body);
        
        if(resBodyOfSignUp['success'] == true)
        {
          Fluttertoast.showToast(msg: "SignUp successful.");

          setState(() {
            staffNoController.clear();
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            phoneNoController.clear();
          });
          
        }
        else
        {
          Fluttertoast.showToast(msg: "Error occurred. SignUp unsuccessful. Please try again.");
        }
      }
    }

    catch(e)
    {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
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

                  const SizedBox(height:30),

                  //signup screen header
                  Container(
                    height: 185,
                    // height: MediaQuery.of(context).size.height / 5,
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/images/5.png")
                    ),
                    ),
                  ),

                  // sign up form
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
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
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 80),
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [

                                // staff no
                                TextFormField(
                                  controller: staffNoController,
                                  validator: (val) => val == " " ? "Please write staff no." : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.work,
                                      color: Colors.black,
                                    ),
                                    hintText: "Staff No",
                                    
                                    border: OutlineInputBorder(
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
                                
                                // name
                                TextFormField(
                                  controller: nameController,
                                  validator: (val) => val == " " ? "Please write name" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    hintText: "Full Name",
                                    
                                    border: OutlineInputBorder(
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

                                // email
                                TextFormField(
                                  controller: emailController,
                                  validator: (val) => val == " " ? "Please write email" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: "Email",
                                    
                                    border: OutlineInputBorder(
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

                                // password
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

                                // phone no
                                TextFormField(
                                  controller: phoneNoController,
                                  validator: (val) => val == " " ? "Please write phone no." : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.phone_iphone,
                                      color: Colors.black,
                                    ),
                                    hintText: "Phone No",
                                    
                                    border: OutlineInputBorder(
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

                                // button
                                Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: ()
                                    {
                                      if(formKey.currentState!.validate())
                                      {
                                        // validate the email
                                        validateUserStaffNo();
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 28,
                                        vertical: 10,
                                      ),

                                    child: Text(
                                      "Register",
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

                          const SizedBox(height: 16),

                          // Already have account and login here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an Account?",
                              ),

                              TextButton(
                                onPressed: (){
                                  Get.to(() => const LoginScreen()); 
                                },
                                child: Text(
                                  "Login Here",
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

                ],
              ),
            ),
          );
        }
      ),
    );
    
  }
}