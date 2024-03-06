import 'package:flutter/material.dart';
import 'package:lcms_app/view_model/services/SplashServices.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  SplashServices splashServices = SplashServices();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true); // Reverse the animation for top to bottom transition

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    splashServices.checkAuth(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align( // Align the widget to center horizontally
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    child: const Center(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image12.png'),
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(0.0, -100.0 * _controller.value),
                      child: child,
                    );
                  },
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     'Covid-19\nTracker App',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
