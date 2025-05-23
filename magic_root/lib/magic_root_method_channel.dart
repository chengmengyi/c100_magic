import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'magic_root_platform_interface.dart';

/// An implementation of [MagicRootPlatform] that uses method channels.
class MethodChannelMagicRoot extends MagicRootPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('magic_root');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
