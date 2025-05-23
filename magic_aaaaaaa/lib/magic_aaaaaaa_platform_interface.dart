import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'magic_aaaaaaa_method_channel.dart';

abstract class MagicAaaaaaaPlatform extends PlatformInterface {
  /// Constructs a MagicAaaaaaaPlatform.
  MagicAaaaaaaPlatform() : super(token: _token);

  static final Object _token = Object();

  static MagicAaaaaaaPlatform _instance = MethodChannelMagicAaaaaaa();

  /// The default instance of [MagicAaaaaaaPlatform] to use.
  ///
  /// Defaults to [MethodChannelMagicAaaaaaa].
  static MagicAaaaaaaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MagicAaaaaaaPlatform] when
  /// they register themselves.
  static set instance(MagicAaaaaaaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
