import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/users/authentication/login_screen.dart';
import 'package:msq_mysql/users/fragments/dashboard.dart';
import 'package:msq_mysql/users/userPreferences/user_prefs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MSQ App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot)
        {
          if(dataSnapShot.data == null){
            return const LoginScreen();
          }
          else{
            return const DashboardOfFragments();
          }
        },
        ),
    );
  }
}
