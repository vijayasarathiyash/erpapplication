import 'package:erpapplication/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        _progress += 0.01;
      });

      if (_progress >= 1) {
        timer.cancel();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A5CFF), Color(0xFF3B3DDC)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Stack(
              alignment: Alignment.center,
              children: [
                Lottie.asset('assets/lottie/splash.json', width: 220),
              ],
            ),
            Image.asset(
              'assets/images/erp_enterprice.png',
              width: MediaQuery.of(context).size.width,
              height: 450,
              fit: BoxFit.contain,
            )
            ,
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "ERP",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "ENTERPRISE SOLUTION",
              style: TextStyle(color: Colors.white70, letterSpacing: 2),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.white24,
                color: Colors.lightBlueAccent,
                minHeight: 6,
              ),
            ),

            const SizedBox(height: 12),
            Text(
              "${(_progress * 100).toInt()}%",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
