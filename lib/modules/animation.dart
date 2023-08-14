import 'package:abonaatomas/modules/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class animation extends StatefulWidget
{
  @override
  State<animation> createState() => _animationState();
}
class _animationState extends State<animation> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      if (_controller.value > 1.5) {

        _controller.value = 1.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/images/church.json',
          fit: BoxFit.cover,
          reverse: false,
          repeat: false,
          animate: true,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Layout()),

                  ));
          },
        ),
      ),
    );
  }
}