import 'package:flutter/material.dart';
import 'food_item.dart';

class GameState extends ChangeNotifier {
  String playerName = '';
  int currentRound = 0;
  int nutritionScore = 0;
  double saturation = 100.0;
  int correctChoices = 0;
  
  final List<FoodItem> foods = [
    FoodItem('Apple', 'assets/images/food.apple.png', isHealthy: true, nutrition: 10, saturation: 20),
    FoodItem('Broccoli', 'assets/images/food.broccoli.png', isHealthy: true, nutrition: 15, saturation: 15),
    FoodItem('Carrot', 'assets/images/food.carrot.jpg', isHealthy: true, nutrition: 10, saturation: 10),
    FoodItem('Burger', 'assets/images/food.burger.png', isHealthy: false, nutrition: -10, saturation: 30),
    FoodItem('Chips', 'assets/images/food.chips.png', isHealthy: false, nutrition: -15, saturation: 25),
    FoodItem('Chocolate', 'assets/images/food_chocolate.png', isHealthy: false, nutrition: -20, saturation: 40),
  ];

  void startGame(String name) {
    playerName = name;
    currentRound = 0;
    nutritionScore = 0;
    saturation = 100.0;
    correctChoices = 0;
    notifyListeners();
  }

  void updateSaturation(double dt) {
    saturation = (saturation - 0.8 * dt).clamp(0, 100);
    notifyListeners();
  }

  void processCollision(FoodItem food) {
    nutritionScore += food.nutrition;
    saturation = (saturation + food.saturation).clamp(0, 100);
    if (food.isHealthy) correctChoices++;
    currentRound++;
    notifyListeners();
  }

  bool get isGameOver => saturation <= 0 || currentRound >= 5;
  bool get isWin => correctChoices >= 4;
}