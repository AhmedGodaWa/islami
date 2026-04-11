import 'package:just_audio/just_audio.dart';

class RadioController {
  RadioController._();

  static final RadioController instance = RadioController._();

  final AudioPlayer player = AudioPlayer();

  final String radioUrl = "https://stream.radiojar.com/8s5u5tpdtwzuv";

  bool isLoaded = false;
  bool isLoading = false;

  // bool isPlaying = false;

  Future<void> loadRadio() async {
    if (isLoaded || isLoading) return;

    isLoading = true;

    try {
      await player.setUrl(radioUrl);
      isLoaded = true;
    } catch (e) {
      print("Radio load interrupted: $e");
    }

    isLoading = false;
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
