// import 'package:flutter/material.dart';
// import 'package:assignment_app/screen/MealsApp/models/meal_model.dart';
// import 'package:assignment_app/screen/MealsApp/services/api_service.dart';
// import 'package:assignment_app/screen/MealsApp/widgets/meal_tile.dart';

import 'package:flutter/material.dart';
import 'package:assignment_app/screen/MealsApp/models/meal_model.dart'; // Correct import
import 'package:assignment_app/screen/MealsApp/services/api_service.dart';
import 'package:assignment_app/screen/MealsApp/widgets/meal_tile.dart';


class MealsScreen extends StatefulWidget {
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> meals = [];
  List<Meal> filteredMeals = [];
  bool showVegetarian = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    ApiService apiService = ApiService();
    meals = await apiService.fetchMeals();
    filterMeals();
  }

  void filterMeals() {
    setState(() {
      filteredMeals = meals.where((meal) {
        final matchesSearch = meal.title.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesFilter = !showVegetarian || meal.isVegetarian;
        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
        actions: [
          IconButton(
            icon: Icon(showVegetarian ? Icons.filter_list : Icons.filter_list_off),
            onPressed: () {
              setState(() {
                showVegetarian = !showVegetarian;
                filterMeals();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Search meals...'),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filterMeals();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                return MealTile(meal: filteredMeals[index]);
              },
            ),
          ),

        ],
      ),
    );
  }
}
