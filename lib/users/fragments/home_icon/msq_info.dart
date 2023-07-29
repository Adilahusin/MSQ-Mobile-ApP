import 'package:flutter/material.dart';

import 'Strings_msq.dart';

class MSQInfo extends StatefulWidget {
  const MSQInfo({super.key});

  @override
  State<MSQInfo> createState() => _MSQInfoState();
}

class _MSQInfoState extends State<MSQInfo> {

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
      ),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                image: 'lib/images/think.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent
              ),

              makePage(
                reverse: true,
                image: 'lib/images/good.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent
              ),

              makePage(
                image: 'lib/images/3.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
              ),
          ),
        ],
      )
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          !reverse ? 
          Column(
            children: <Widget>[
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
            ),
            
            const SizedBox(height: 30),

            ],
          ) : const SizedBox(),

            Text(title, style: const TextStyle(
              color: Colors.black, 
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),

            const SizedBox(height: 20),

            Text(content, textAlign: TextAlign.center, style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),),

            reverse ? 
          Column(
            children: <Widget>[
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
            ),
            
            const SizedBox(height: 30),

            ],
          ) : const SizedBox(),

        ],
        ),
      );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 30 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.yellow.shade800,
        borderRadius: BorderRadius.circular(5),
      ),
      );
  }
  
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}