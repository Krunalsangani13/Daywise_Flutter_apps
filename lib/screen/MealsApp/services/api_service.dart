import 'package:assignment_app/screen/MealsApp/models/meal_model.dart';

class ApiService {
  Future<List<Meal>> fetchMeals() async {
    // Simulate a local API call
    await Future.delayed(Duration(seconds: 1));
    return [
      Meal(id: '1', title: 'Veg Pizza', imageUrl: 'url_to_image', isVegetarian: true),
      Meal(id: '2', title: 'Chicken Burger', imageUrl: 'url_to_image', isVegetarian: false),
      // Add more meals
    ];
  }
}
