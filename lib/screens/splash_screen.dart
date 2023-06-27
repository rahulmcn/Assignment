import 'package:flutter/material.dart';

import 'package:assignment/constants/assets_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool registerKey = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          hichLogo,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
