import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import '../models/food_item.dart';

class FoodItemComponent extends SpriteComponent 
    with CollisionCallbacks, HasGameRef {
  final FoodItem food;
  final int lane;
  final double speed;
  
  FoodItemComponent({
    required this.food,
    required this.lane,
    this.speed = 150.0,
  });

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(food.assetPath);
    size = Vector2(60, 60);
    final laneWidth = gameRef.size.x / 3;
    position = Vector2(
      laneWidth * lane + laneWidth / 2,
      -size.y,
    );
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += speed * dt;
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}