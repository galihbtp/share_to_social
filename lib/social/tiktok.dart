import 'dart:developer';

import 'package:flutter/services.dart';

///
class Tiktok {
  ///
  static const platform = MethodChannel('social_sharing');

  /// you can share multi files (images and videos)
  static shareToAndroid(List<String> files) async {
    try {
      await platform.invokeMethod('shareToTiktok', {'filePaths': files});
    } on PlatformException catch (e, s) {
      log("Failed with error : '${e.message}'. \n $s");
      throw (e, s);
    } catch (e, s) {
      log("Failed with error : '$e'. \n $s");
      throw (e, s);
    }
  }

  /// you must share one type of files (images or videos)
  static shareToIos(
      {required List<String> files,
      required String redirectUrl,
      required String filesType}) async {
    try {
      await platform.invokeMethod('shareToTikTokMultiFiles', {
        'filePaths': files,
        "redirectUrl": redirectUrl,
        "fileType": filesType
      });
    } on PlatformException catch (e, s) {
      log("Failed with error : '${e.message}'. \n $s");
      throw (e, s);
    } catch (e, s) {
      log("Failed with error : '$e'. \n $s");
      throw (e, s);
    }
  }
}
