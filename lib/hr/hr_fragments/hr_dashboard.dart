import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../hrPreferences/current_hr.dart';
import '../hr_fragments/hr_home.dart';
import '../hr_fragments/hr_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HrDashboard extends StatefulWidget 
{

  static final List<Widget> _fragmentScreen = <Widget>[
    const HrHomeFragment(),
    HrProfileFragment(),
  ];

  const HrDashboard({super.key});

  @override
  State<HrDashboard> createState() => _HrDashboardState();
}

class _HrDashboardState extends State<HrDashboard> {
  final CurrentHr _rememberCurrentHr = Get.put(CurrentHr());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentHr(),
      initState: (currentState){
        _rememberCurrentHr.getHrInfo();
      },

      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: HrDashboard._fragmentScreen.elementAt(_selectedIndex),
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100.0, vertical: 20.0),
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