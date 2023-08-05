import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static avaibleBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate({bool biometric = false}) async { 
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options:  AuthenticationOptions(
              biometricOnly: biometric 
              ));

      return (didAuthenticate, didAuthenticate ? 'did' : 'canceled for user');
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) return (false, 'not enrolled');
      if (e.code == auth_error.lockedOut) return (false, 'many tries error');
      if (e.code == auth_error.notAvailable) return (false, 'there is no biometric sensor');
      if (e.code == auth_error.passcodeNotSet) return (false, 'there is no passcode set');
      if (e.code == auth_error.permanentlyLockedOut) return (false, 'available phone restart');

      return (false, e.toString());
    }
  }
}
