import 'package:anime_list/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TwistingAnimation extends StatefulWidget {
  final double size;
  // final List<Widget> widgets;

  const TwistingAnimation({
    Key? key,
    required this.size,
    // required this.widgets,
  }) : super(key: key);

  @override
  _TwistingAnimationState createState() => _TwistingAnimationState();
}

class _TwistingAnimationState extends State<TwistingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    // final Color firstColor = widget.leftDotColor;
    // final Color secondColor = widget.rightDotColor;
    // final double dotSize = size / 3;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Container(
          color: Colors.transparent,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Visibility(
                visible: _animationController.value < 0.5,
                child: Transform.rotate(
                  angle: Tween<double>(
                    begin: 0,
                    end: math.pi,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.0,
                            0.5,
                            curve: Curves.elasticOut,
                          ),
                        ),
                      )
                      .value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //TODO
                      SizedBox(
                        width: size / 3,
                        height: size / 3,
                        child: Assets.image.naruto.image(fit: BoxFit.fill),
                      ),
                      SizedBox(
                        width: size / 3,
                        height: size / 3,
                        child: Assets.image.pikachu.image(fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _animationController.value > 0.5,
                child: Transform.rotate(
                  angle: Tween<double>(
                    begin: -math.pi,
                    end: 0,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.5,
                            1.0,
                            curve: Curves.elasticOut,
                          ),
                        ),
                      )
                      .value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //TODO
                      SizedBox(
                        width: size / 3,
                        height: size / 3,
                        child: Assets.image.naruto.image(fit: BoxFit.fill),
                      ),
                      SizedBox(
                        width: size / 3,
                        height: size / 3,
                        child: Assets.image.pikachu.image(fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
