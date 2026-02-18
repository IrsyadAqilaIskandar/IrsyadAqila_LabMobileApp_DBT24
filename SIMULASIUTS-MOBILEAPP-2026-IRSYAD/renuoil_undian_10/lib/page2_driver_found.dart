import 'package:flutter/material.dart';
import 'page3_driver_detail.dart';

class Page2DriverFound extends StatelessWidget {
  const Page2DriverFound({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Page3DriverDetail())),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5C842),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.electric_moped, size: 110, color: Colors.black87),
                const SizedBox(height: 40),
                const Text(
                  'You Got A Driver!',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your order number is #1234',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                const Text(
                  'The driver is heading to your location',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87, height: 1.4),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sit tight and wait for your oil to be delivered.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87, height: 1.4),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                Text(
                  'Tap anywhere to continue',
                  style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.35)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
