import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => route == null,
        );
      }
    });

    _controller.forward(); //播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      // child: Image.network(
      //   'https://b-ssl.duitang.com/uploads/item/201112/22/20111222203921_UZKyd.jpg',
      //   fit: BoxFit.cover,
      // ),
      child: Image.asset(
        'lib/assets/splashScreen.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
