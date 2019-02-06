import 'package:flutter/material.dart';

class AnimatedAppearing extends ImplicitlyAnimatedWidget {
  AnimatedAppearing({
    Key key,
    @required this.appearingFactor,
    this.child,
    Curve curve = Curves.easeIn,
    @required Duration duration,
  })  : assert(appearingFactor != null),
        assert(!appearingFactor.isNegative),
        super(key: key, curve: curve, duration: duration);

  final double appearingFactor;
  final Widget child;

  @override
  _AnimatedAppearingState createState() => _AnimatedAppearingState();
}

class _AnimatedAppearingState
    extends AnimatedWidgetBaseState<AnimatedAppearing> {
  Tween<double> _appearing;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _appearing = visitor(
        _appearing,
        widget.appearingFactor,
        (dynamic value) => Tween<double>(
            begin: value)); // EdgeInsetsGeometryTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: Align(
            heightFactor: _appearing.evaluate(animation),
            child: Opacity(
                opacity: _appearing.evaluate(animation), child: widget.child)));
  }
}
