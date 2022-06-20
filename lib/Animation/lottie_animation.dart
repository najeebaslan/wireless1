import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


//////////////////////////////////////////////////////////////////
///this the beast 1
class LottieLoding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Lottie.asset('assets/lottie/loding.json',height: 80,repeat: true,width: 70)
            // Lottie.network(
            //     'https://assets3.lottiefiles.com/packages/lf20_gh9cvoux.json',),

      
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////
///this the beast 2
class Lottie1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Lottie.asset('assets/lottie/lodingPags.json',height: 80,repeat: true,width: 70)
            // Lottie.network(
            //     'https://assets3.lottiefiles.com/packages/lf20_gh9cvoux.json',),

      
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////
//the beast 3
class Lottie2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      print('mmmm');
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            //https://assets2.lottiefiles.com/packages/lf20_ijpki0gq.json
            Lottie.asset('assets/lottie/signin.json',),
            Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_47Daup.json'),
            Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_ijpki0gq.json'),
            Lottie.asset('assets/lottie/location.json',),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            
            Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_db1qgnye.json',height: 60),

      
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////\

class MyApp13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            
            Lottie.network(
                'https://assets8.lottiefiles.com/datafiles/zc3XRzudyWE36ZBJr7PIkkqq0PFIrIBgp4ojqShI/newAnimation.json'),

      
          ],
        ),
      ),
    );
  }
}


///////////////////////////////////////////////////////////////
class Lottie3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Lottie.asset('assets/lottie/signin.json',)

      
          ],
        ),
      ),
    );
  }
}