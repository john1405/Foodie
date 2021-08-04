import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Helpers/Footer.dart';
import 'package:foodie/Helpers/Headers.dart';
import 'package:foodie/Helpers/Middle.dart';
import 'package:foodie/Services/ManageData.dart';
import 'package:foodie/Services/maps.dart';
import 'package:foodie/Views/Splash_Screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Headers()),
          ChangeNotifierProvider.value(value: MiddleHelpers()),
          ChangeNotifierProvider.value(value: ManageData()),
          ChangeNotifierProvider.value(value: Footers()),
          ChangeNotifierProvider.value(value: GenerateMaps()),
        ],
        child: MaterialApp(
          title: 'Foodie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: Colors.redAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        ));
  }
}
