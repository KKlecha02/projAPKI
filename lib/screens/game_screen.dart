import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../components/player.dart';
import '../components/parallax_background.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: HealthyFoodGame(gameState: context.read<GameState>())),
          const HudOverlay(),
        ],
      ),
    );
  }
}

class HealthyFoodGame extends FlameGame with HasCollisionDetection {
  final GameState gameState;
  late Player player;
  
  HealthyFoodGame({required this.gameState});

  @override
  Future<void> onLoad() async {
    add(ParallaxBackground());
    player = Player(gameState: gameState);
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    gameState.updateSaturation(dt);
  }
}

class HudOverlay extends StatelessWidget {
  const HudOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: gameState.saturation / 100,
            backgroundColor: Colors.grey,
            color: Colors.green,
            minHeight: 20,
          ),
          Text(
            'Nutrition Score: ${gameState.nutritionScore}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            'Round: ${gameState.currentRound}/5',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}