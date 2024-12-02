import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmailSenderScreen extends StatefulWidget {
  @override
  _EmailSenderScreenState createState() => _EmailSenderScreenState();
}

class _EmailSenderScreenState extends State<EmailSenderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Function to send email
  Future<void> sendEmail(String name, String email, String message) async {
    const String serviceId = 'service_vrq0pch'; // Replace with your Service ID
    const String templateId = 'template_ja3curw';        // Replace with your Template ID
    const String publicKey = 'ywI4Qd5-ou03nipT4'; // Replace with your Public Key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': message,
        },
      }),
    );

  if (response.statusCode == 200) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Email sent successfully!')),
  );
} else {
  print('Response code: ${response.statusCode}');
  print('Response body: ${response.body}');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Failed to send email: ${response.body}')),
  );
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Message'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendEmail(
                  _nameController.text,
                  _emailController.text,
                  _messageController.text,
                );
              },
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
