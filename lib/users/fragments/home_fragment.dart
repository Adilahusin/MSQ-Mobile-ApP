import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msq_mysql/users/fragments/home_icon/suggestions.dart';
import 'home_icon/guidelines.dart';
import 'home_icon/msq_info.dart';
import 'home_icon/uctati.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
}

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade600,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            
            child: Column(
              children: [
                 const SizedBox(height: 50),
                 
                 ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('MSQ Mobile Application',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                 ),
              ],
            )
          ),

          const SizedBox(height: 45),

          Container( 
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),

              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  // What is MSQ?
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MSQInfo()));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,5),
                          color: Theme.of(context).hintColor.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          ),
                      ]
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.info, size: 35, color: Colors.deepOrange),
                        SizedBox(height: 20),
                        Text("What is MSQ?", style: TextStyle(color: Colors.black, fontSize: 17)),
                      ],)
                  ),
                  ),               

                  // Guidelines
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Guidelines()));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,5),
                          color: Theme.of(context).hintColor.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          ),
                      ]
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.question, size: 35, color: Colors.lightGreen.shade600),
                        const SizedBox(height: 20),
                        const Text("Guidelines", style: TextStyle(color: Colors.black, fontSize: 17)),
                      ],)
                  ),
                  ),

                  // UCTATI
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const UCTATI()));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,5),
                          color: Theme.of(context).hintColor.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          ),
                      ]
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, size: 35, color: Colors.indigoAccent.shade700),
                        const SizedBox(height: 20),
                        const Text("UC TATI", style: TextStyle(color: Colors.black, fontSize: 17)),
                      ],)
                  ),
                  ),

                  // Suggestions
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Suggestions()));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,5),
                          color: Theme.of(context).hintColor.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          ),
                      ]
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.solidStar, size: 35, color: Colors.pink.shade400),
                        const SizedBox(height: 20),
                        const Text("Suggestions", style: TextStyle(color: Colors.black, fontSize: 17)),
                      ],)
                  ),
                  ),

                ],
            ),
            ),
          )
        ],
      ),
    );
  }
}