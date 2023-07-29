import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
}

class CsHomeFragment extends StatefulWidget {
  const CsHomeFragment({super.key});

  @override
  State<CsHomeFragment> createState() => _CsHomeFragmentState();
}

class _CsHomeFragmentState extends State<CsHomeFragment> {
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
                  title: Text('MSQ Mobile App (Admin)',
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

          
        ],
      ),
    );
  }
}