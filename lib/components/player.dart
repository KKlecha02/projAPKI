import 'package:flame/components.dart';
import '../models/game_state.dart';

class Player extends SpriteComponent with HasGameRef {
  final GameState gameState;
  
  Player({required this.gameState});
  
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('assets/images/player.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    size = Vector2(80, 80);
    anchor = Anchor.center;
  }

  void move(double dx) {
    position.x = (position.x + dx).clamp(50, gameRef.size.x - 50);
  }
}