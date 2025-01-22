import 'package:just_audio/just_audio.dart';
import 'package:project_management_app/constants/string_constants.dart';

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

  Future<void> playAlarm() async {
    if (_player.playing) {
      await _player.stop();
    }

    _player.setAsset(alarmSound);
    await _player.play();
    await _player.stop();
  }

  // Method to stop the sound
  Future<void> stopSound() async {
    await _player.stop();
  }
}
