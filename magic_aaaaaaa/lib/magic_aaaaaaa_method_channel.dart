import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'magic_aaaaaaa_platform_interface.dart';

/// An implementation of [MagicAaaaaaaPlatform] that uses method channels.
class MethodChannelMagicAaaaaaa extends MagicAaaaaaaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('magic_aaaaaaa');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
