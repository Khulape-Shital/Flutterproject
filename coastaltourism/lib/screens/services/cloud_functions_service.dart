import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionsService {
  static Future<void> sendOtp(String email) async {
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendOtp');
    try {
      final response = await callable({'email': email});
      print('OTP sent successfully: ${response.data['message']}');
    } catch (e) {
      print('Error sending OTP: $e');
    }
  }
}

