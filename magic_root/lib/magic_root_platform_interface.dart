import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'magic_root_method_channel.dart';

abstract class MagicRootPlatform extends PlatformInterface {
  /// Constructs a MagicRootPlatform.
  MagicRootPlatform() : super(token: _token);

  static final Object _token = Object();

  static MagicRootPlatform _instance = MethodChannelMagicRoot();

  /// The default instance of [MagicRootPlatform] to use.
  ///
  /// Defaults to [MethodChannelMagicRoot].
  static MagicRootPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MagicRootPlatform] when
  /// they register themselves.
  static set instance(MagicRootPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
