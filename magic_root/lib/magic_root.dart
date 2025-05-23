
import 'magic_root_platform_interface.dart';

class MagicRoot {
  Future<String?> getPlatformVersion() {
    return MagicRootPlatform.instance.getPlatformVersion();
  }
}
