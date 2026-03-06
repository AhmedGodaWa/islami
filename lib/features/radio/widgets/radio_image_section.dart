import 'package:flutter/material.dart';

class RadioImageSection extends StatelessWidget {
  const RadioImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth;
    //final imageHeight = imageWidth / 1.85;
    return SizedBox(
      width: imageWidth,
      // height: imageHeight,
      child: Image.asset(
        'assets/images/body of radio.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
