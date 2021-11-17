import 'package:connectivity/connectivity.dart';

class InternetConnectionHelper {
  InternetConnectionHelper._privateConstructor();

  static final InternetConnectionHelper instance = InternetConnectionHelper._privateConstructor();

  Future<bool> hasInternetConnection() async {
    final result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      return false;
    } else {
    return true;
    }
  }
}
