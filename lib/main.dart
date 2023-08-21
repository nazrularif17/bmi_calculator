import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightSliderValue = 170;
  double weightSliderValue = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("BMI Calculator"), backgroundColor: Colors.redAccent),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "BMI Calculator",
              style: TextStyle(color: Colors.red, fontSize: 34),
            ),
            SizedBox(
              height: 5,
            ),
            Text("We care about your health", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 10,
            ),
            Image.network(
                "https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg?_=07167"),
            Text(
              "Height ${heightSliderValue} (cm)",
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: heightSliderValue,
              max: 200,
              min: 100,
              label: heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  heightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Weight ${weightSliderValue} (kg)",
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: weightSliderValue,
              max: 150,
              min: 40,
              label: weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  weightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextButton.icon(
              onPressed: () {
                // bmi = berat / (tinggi)^2
                var tempBmi =
                    weightSliderValue / pow((heightSliderValue / 100), 2);
                print("BMI = ${tempBmi.round()}");
              },
              icon: Icon(Icons.favorite),
              label: Text("Calculate BMI"),
            )
          ],
        ),
      ),
    );
  }
}
