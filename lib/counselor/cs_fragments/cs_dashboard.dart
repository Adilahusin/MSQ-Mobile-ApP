import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msq_mysql/counselor/csPreferences/current_cs.dart';
import 'package:msq_mysql/counselor/cs_fragments/cs_home.dart';
import 'package:msq_mysql/counselor/cs_fragments/cs_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CsDashboard extends StatefulWidget 
{

  static final List<Widget> _fragmentScreen = <Widget>[
    const CsHomeFragment(),
    CsProfileFragment(),
  ];

  const CsDashboard({super.key});

  @override
  State<CsDashboard> createState() => _CsDashboardState();
}

class _CsDashboardState extends State<CsDashboard> {
  final CurrentCounselor _rememberCurrentCounselor = Get.put(CurrentCounselor());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentCounselor(),
      initState: (currentState){
        _rememberCurrentCounselor.getCounselorInfo();
      },

      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CsDashboard._fragmentScreen.elementAt(_selectedIndex),
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