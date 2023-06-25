
import 'package:droppp_flutter/modelw.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'category.dart';
import 'login.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (_) => Cart()),
//   ], child: MyApp()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
    ChangeNotifierProvider(create: (_) => Wishlist()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class screen extends StatefulWidget {
//   const screen({Key? key}) : super(key: key);

//   @override
//   State<screen> createState() => _screenState();
// }

// class _screenState extends State<screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.deepPurple,
//       body: Center(
//         child: ListView(children: <Widget>[
//           SizedBox(
//             height: 200,
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//               // shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(80.0)),
//               // textColor: Colors.white,
//               // padding: const EdgeInsets.all(0),
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 50.0,
//                 //width: size.width * 0.5,
//                 width: 270,
//                 decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(80.0),
//                     gradient: new LinearGradient(colors: [
//                       Color.fromARGB(255, 255, 136, 34),
//                       Color.fromARGB(255, 255, 177, 41)
//                     ])),
//                 padding: const EdgeInsets.all(0),
//                 child: Text(
//                   "LOGIN",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => RegistrationScreen()));
//               },
//               // shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(80.0)),
//               // textColor: Colors.white,
//               // padding: const EdgeInsets.all(0),
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 50.0,
//                 //width: size.width * 0.5,
//                 width: 270,
//                 decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(80.0),
//                     gradient: new LinearGradient(colors: [
//                       Color.fromARGB(255, 255, 136, 34),
//                       Color.fromARGB(255, 255, 177, 41)
//                     ])
//                     ),
//                 padding: const EdgeInsets.all(0),
//                 child: Text(
//                   "REGISTER",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
