import 'package:anime_list/utils/constant/enum.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class FadeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;
  final FadeDirection direction;
  final bool playAnimation;
  // final Function() onComplete;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
    // required this.onComplete,
    this.direction = FadeDirection.down,
    AssetImage? image,
    this.playAnimation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTween<AniProps>()
    //   ..add(
    //     AniProps.opacity,
    //     Tween(begin: 0.0, end: 1.0),
    //     const Duration(milliseconds: 300),
    //   )
    //   ..add(
    //     AniProps.translateY,
    //     Tween(
    //       begin: direction == FadeDirection.down ? -30.0 : 30.0,
    //       end: 0.0,
    //     ),
    //     const Duration(milliseconds: 300),
    //     Curves.easeOut,
    //   );

    final MovieTween tween = MovieTween()
      ..scene(
        duration: const Duration(milliseconds: 1000),
        // begin: const Duration(milliseconds: 0),
        // end: const Duration(milliseconds: 6000)
      ).tween(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..scene(
        duration: const Duration(milliseconds: 1000),
        // begin: const Duration(milliseconds: 0),
        // end: const Duration(milliseconds: 6000)
      ).tween(AniProps.translateY, Tween(begin: -50.0, end: 0.0));
    print("tween.duration ${tween.duration}" );

    return playAnimation
        ? PlayAnimationBuilder<Movie>(
            delay: Duration(milliseconds: delay),
            duration: tween.duration,
            tween: tween,
            child: child,
            builder: (context, value, child) => Opacity(
              opacity: value.get(AniProps.opacity),
              child: Transform.translate(
                offset: Offset(
                  0,
                  value.get(AniProps.translateY),
                ),
                child: child,
              ),
            ),
          )
        : child;
  }
}
