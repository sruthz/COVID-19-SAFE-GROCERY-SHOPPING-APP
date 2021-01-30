import 'package:flutter/services.dart';
import 'package:grocery/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:grocery/models/user.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/ui/signin.dart';
import 'package:grocery/ui/signup.dart';
import 'package:grocery/ui/splashscreen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value : AuthService().user,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:grocery/constants/constants.dart';
// import 'package:grocery/ui/signin.dart';
// import 'package:grocery/ui/signup.dart';
// import 'package:grocery/ui/splashscreen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Login",
//       theme: ThemeData(primaryColor: Colors.orange[200]),
//       routes: <String, WidgetBuilder>{
//         WRAPPER : (BuildContext context) =>  Wrapper(),
//         SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
//         SIGN_IN: (BuildContext context) =>  SignInPage(),
//         SIGN_UP: (BuildContext context) =>  SignUpScreen(),
//       },
//       initialRoute: WRAPPER,
//     );
//   }
// }


