// Add this import
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class ParallaxBackground extends ParallaxComponent {
  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('assets/images/background.png'),
        ParallaxImageData('assets/images/trees.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.5, 0),
    );
  }
}