// lib/services/email_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';


class EmailService {
  static const String serviceId = 'service_3e0j9qz';
  static const String templateId = 'template_n7p41sj';
  static const String userId = 'FZ3dzSzPnOPkT_mzl';

  static Future<void> sendJobApplicationEmail({
    required String name,
    required String phone,
    required String gender,
    required String age,
    required String state,
    required String job,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'phone': phone,
          'gender': gender,
          'age': age,
          'state': state,
          'job': job,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Email sent successfully!');
    } else {
      print('❌ Failed to send email: ${response.body}');
    }
  }
}
