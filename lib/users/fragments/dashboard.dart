import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/users/fragments/home_fragment.dart';
import 'package:msq_mysql/users/fragments/quiz_fragment.dart';
import 'package:msq_mysql/users/fragments/profile.dart';
import 'package:msq_mysql/users/userPreferences/current_user.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardOfFragments extends StatefulWidget 
{

  static final List<Widget> _fragmentScreen = <Widget>[
    const HomeFragment(),
    const QuizHomeFragment(),
    ProfileFragment(),
  ];

  const DashboardOfFragments({super.key});

  @override
  State<DashboardOfFragments> createState() => _DashboardOfFragmentsState();
}

class _DashboardOfFragmentsState extends State<DashboardOfFragments> {
  final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState){
        _rememberCurrentUser.getUserInfo();
      },

      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: DashboardOfFragments._fragmentScreen.elementAt(_selectedIndex),
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 20.0),
            child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.yellow.shade700,
              tabBackgroundColor: Colors.black,
              gap: 10,
              padding: const EdgeInsets.all(16),
              
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState((){
                  _selectedIndex = index;
                });
              },
          
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home'
                ),
                GButton(
                  icon: Icons.quiz,
                  text: 'Quiz'
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile'
                ),
              ]
            ),
          ),

        );
      }
      );
  }
}