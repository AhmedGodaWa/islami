import 'package:flutter/material.dart';
import 'package:islami/features/radio/controller/radio_controller.dart';
import 'package:islami/features/radio/widgets/radio_controls_section.dart';
import 'package:islami/features/radio/widgets/radio_image_section.dart';
import 'package:islami/features/radio/widgets/radio_title_section.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override
  void initState() {
    super.initState();
    controller.loadRadio();
  }

  @override
  void dispose() {
    controller.pauseRadio();
    super.dispose();
  }

  void togglePlay() async {
    if (controller.player.playing) {
      // controller.isPlaying = false;
      setState(() {});

      await controller.pauseRadio();
    } else {
      // controller.isPlaying = true;
      setState(() {});

      await controller.playRadio();
    }
  }

  final RadioController controller = RadioController.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).size.height * 0.12,
          ),
        ),
        const RadioImageSection(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.07),
        const RadioTitleSection(title: 'إذاعة القرآن الكريم'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        RadioControlsSection(
          onPlay: togglePlay,
          isPlaying: controller.player.playing,
        ),
      ],
    );
  }
}
