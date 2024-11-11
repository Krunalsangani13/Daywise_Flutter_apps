import 'package:assignment_app/screen/calculator/Calculator.dart';
import 'package:assignment_app/screen/bmi/bmi.dart';
import 'package:assignment_app/screen/expense/expense.dart';
import 'package:assignment_app/screen/dark_light_theme/screen.dart' as darkTheme;
import 'package:assignment_app/screen/weather_app/home_screen.dart' as weatherApp;
import 'package:assignment_app/screen/MealsApp/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bmi()),
                  );
                },
                child: Text('Bmi Calculater app'),
              ),

              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => expense()),
                  );
                },
                child: Text('expense app'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calculator()),
                  );
                },
                child: Text('Calculator app'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => darkTheme.HomeScreen()),
                  );
                },
                child: Text('theme app'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => weatherApp.HomeScreen()),
                  );
                },
                child: Text('weather app'),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealsScreen()),
                  );
                },
                child: Text('Meals app'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
