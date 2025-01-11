import 'package:just_audio/just_audio.dart';

class AudioService {
  // Private constructor
  AudioService._privateConstructor();

  // The single instance of AudioService
  static final AudioService _instance = AudioService._privateConstructor();

  // Public factory to provide access to the instance
  factory AudioService() {
    return _instance;
  }

  // The AudioPlayer instance
  final AudioPlayer _player = AudioPlayer();

  // Method to play a sound
  Future<void> playSound(String assetPath) async {
    _player.setLoopMode(LoopMode.one);
    _player.setAsset(assetPath);
    await _player.play();
  }

  // Method to stop the sound
  Future<void> stopSound() async {
    await _player.stop();
  }
}
