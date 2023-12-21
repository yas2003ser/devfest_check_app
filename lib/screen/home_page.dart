import 'package:check/screen/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("assets/AppBar.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(child: Image.asset("assets/devfest.png")),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/Calque 3.svg'),
                const Text(
                  "Devfest Check App",
                  style: TextStyle(fontSize: 35),
                ),
                SvgPicture.asset('assets/Calque 2.svg'),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              textAlign: TextAlign.center,
              'Use this app to check Devfest particepants\nDuring this event',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 19),
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const QRViewScreen(),
                  ),
                );
              },
              child: Image.asset("assets/Register button.png"),
            )
          ],
        ),
      ),
    );
  }
}
