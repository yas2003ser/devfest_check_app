import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:check/screen/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 170),
        child: Image.asset("assets/code.png"),
      ),
      body: FlutterSplashScreen.scale(
        backgroundColor: Colors.white,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Center(child: Image.asset('assets/logo.png')),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 1000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: const HomePage(),
      ),
    );
  }
}
