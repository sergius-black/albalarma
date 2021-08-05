import 'dart:async';

import 'package:albalarma/presentation/features/splash/splash_icon.dart';
import 'package:albalarma/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: AppIconWidget(image: "assets/paltabigote.png")),
    );
  }

  startSplashTimer() {
    var _duration = Duration(milliseconds: 1000);
    return Timer(
        _duration, () => AutoRouter.of(context).replace(AlarmPageRoute()));
  }
}
