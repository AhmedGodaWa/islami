import 'package:flutter/material.dart';

class SebhaView extends StatefulWidget {
  final VoidCallback onTap;
  const SebhaView({super.key, required this.onTap});

  // Sebha layout constants
  static const double headOffsetX = 0.14;
  static const double headOffsetY = -0.45;
  static const double headScale = 0.28;

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sebhaSize = screenWidth * 0.65;
    return SizedBox(
      width: sebhaSize,
      height: sebhaSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, 30), // نفس قيمة الـ padding
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  setState(() {
                    rotation += 0.04;
                  });
                  widget.onTap();
                },
                child: AnimatedRotation(
                  turns: rotation,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/body_sebha_logo.png',
                      width: sebhaSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              sebhaSize * SebhaView.headOffsetX,
              sebhaSize * SebhaView.headOffsetY,
            ),
            child: Image.asset(
              'assets/images/head_sebha_logo.png',
              width: sebhaSize * SebhaView.headScale,
            ),
          ),
        ],
      ),
    );
  }
}
