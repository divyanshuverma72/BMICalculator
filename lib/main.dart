import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();//restricting orientation to portrait.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BMICalculator());
  });
}

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/resultPage': (context) => ResultsPage(),
      },
      theme: ThemeData.dark().copyWith(//themes has data property
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),

      ),
      /*theme: ThemeData(
        primaryColor: Colors.red,
          accentColor: Colors.purple,
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(body1: TextStyle(color: Colors.white))
      ),*/
      home: InputPage(),
    );
  }
}

