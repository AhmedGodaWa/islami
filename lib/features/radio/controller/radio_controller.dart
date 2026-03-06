import 'package:just_audio/just_audio.dart';

class RadioController {
  RadioController._();

  static final RadioController instance = RadioController._();

  final AudioPlayer player = AudioPlayer();

  final String radioUrl = "https://stream.radiojar.com/8s5u5tpdtwzuv";

  bool isLoaded = false;

  // bool isPlaying = false;

  Future<void> loadRadio() async {
    if (!isLoaded) {
      await player.setUrl(radioUrl);
      isLoaded = true;
    }
  }

  Future<void> playRadio() async {
    if (!isLoaded) {
      await loadRadio();
    }

    await player.play();
    // isPlaying = true;
  }

  Future<void> pauseRadio() async {
    await player.stop();
    // isPlaying = false;
  }
}
