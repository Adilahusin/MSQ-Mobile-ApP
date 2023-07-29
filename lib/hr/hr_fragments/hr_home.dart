import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
}

class HrHomeFragment extends StatefulWidget {
  const HrHomeFragment({super.key});

  @override
  State<HrHomeFragment> createState() => _HrHomeFragmentState();
}

class _HrHomeFragmentState extends State<HrHomeFragment> {
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
                  title: Text('MSQ Mobile App (HR)',
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