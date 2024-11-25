import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Security',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'General',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget('1', 'How do I create an account?',
                    'Visit the Sign-Up page and follow the instructions to create a new account.'),
                const SizedBox(
                  height: 10,
                ),
                widget('2', 'How do I reset my password?',
                    'Go to the Forgot Password page and enter your email address. Follow the instructions sent to your email to reset your password.'),
                const SizedBox(
                  height: 10,
                ),
                widget('3', 'How do I update my profile \ninformation?',
                    'Log in to your account, navigate to the Account Settings page, and update your information as needed.'),
                    SizedBox(height: 20,),
                     const Text(
                  'Billing and Payments',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget('1', 'What payment methods do you \naccept?',
                    'We accept major credit cards, PayPal, and other secure payment methods.'),
                const SizedBox(
                  height: 10,
                ),
                widget('2', 'How do I view my billing history?',
                    'Log in to your account and visit the Billing section to view your transaction history.'),
                const SizedBox(
                  height: 10,
                ),
                widget('3', 'How do I update my payment \ninformation?',
                    'Go to the Payment Settings page within your account and update your payment details.'),
                     SizedBox(height: 20,),
                     const Text(
                  'Technical Support',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget('1', 'Why is my account locked?',
                    'Accounts may be locked due to multiple failed login attempts. Please reset your password or contact support for assistance.'),
                const SizedBox(
                  height: 10,
                ),
                widget('2', 'How do I report a bug or technical \nissue?',
                    'Use the Report a Problem form or contact our support team directly to report any issues.'),
               
              ],
            )),
      ),
    );
  }

  Widget widget(pointNum, question, ans) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${pointNum}.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              question,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ],
        ),
        Text(
          ans,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
