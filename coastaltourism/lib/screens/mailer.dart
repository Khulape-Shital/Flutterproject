import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailOtpSender(),
    );
  }
}

class EmailOtpSender extends StatefulWidget {
  const EmailOtpSender({super.key});

  @override
  _EmailOtpSenderState createState() => _EmailOtpSenderState();
}

class _EmailOtpSenderState extends State<EmailOtpSender> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSending = false;

  // Function to generate a 6-digit OTP
  String generateOtp() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString(); // 6-digit OTP
  }

  // Function to send OTP email
  Future<void> sendOtpEmail(String email) async {
    setState(() {
      _isSending = true;
    });

    final String username = 'your-email@gmail.com'; // Replace with your email
    final String password = 'your-app-password'; // Replace with your app password

    final smtpServer = gmail(username, password); // Use SMTP server (like Gmail)
    final otp = generateOtp(); // Generate OTP

    final message = Message()
      ..from = Address(username, 'Your App Name')
      ..recipients.add(email)
      ..subject = 'Your OTP Code'
      ..text = 'Your OTP code is: $otp. It will expire in 10 minutes.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP sent successfully! Check your email.")),
      );
    } catch (e) {
      print('Error sending OTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send OTP: $e")),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send OTP via Email'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter Email Address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSending
                  ? null
                  : () {
                      final email = _emailController.text.trim();
                      if (email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter an email address.")),
                        );
                      } else {
                        sendOtpEmail(email);
                      }
                    },
              child: _isSending
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}