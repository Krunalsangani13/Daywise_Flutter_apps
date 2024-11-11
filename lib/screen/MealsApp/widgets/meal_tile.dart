import 'package:flutter/material.dart';
import 'package:assignment_app/screen/MealsApp/models/meal_model.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  MealTile({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(meal.title),
        leading: ClipOval( // Optional: to make the image circular
          child: Image.network(
            meal.imageUrl,
            width: 50, // Set width
            height: 50, // Set height
            fit: BoxFit.cover, // Adjust the image to cover the box
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error); // Show an error icon if the image fails to load
            },
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            // Handle adding to favorites
          },
        ),
      ),
    );
  }
}
