import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

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
          'Privacy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
            child: Column(
              children: [
                const Text(
                  'Your privacy is important to us. This Privacy Policy explains how we collect, use, share, and protect your personal information. By using our app, you agree to the practices described in this policy. Information We Collect Personal Information We collect personal information that you provide to us, such as:\nName\nEmail address\nPhone number\nBilling information',
                  style: const TextStyle(fontSize: 17),
                ),
                widget('Automatically Collected Information',
                    'We automatically collect certain information when you use our app, including:Device information: IP address, browser type, operating system Usage data: Pages visited, features used, time spent on the app Cookies and Tracking Technologies We use cookies and similar tracking technologies to enhance your experience, analyze usage, and provide personalized content. You can control cookie preferences through your browser settings. We Use Your Information We use your information for various purposes, including: Providing and improving our services: Ensuring the app functions correctly and enhancing user experience.Communications: Sending updates, newsletters, and responding to your inquiries.Personalization: Customizing content and recommendations based on your preferences.Security: Detecting and preventing fraud, Compliance: Ensuring adherence to legal obligations and industry standards.Sharing Your Information We do not sell your personal information. We may share your information with:Service providers: Third parties who assist us in providing and improving our services.Legal requirements: Authorities if required by law, regulation, or legal process.Business transfers: In the event of a merger, acquisition, or sale of assets, your information may be transferred. Data Security We implement robust security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. These measures include encryption, secure servers, and regular security audits. Your Rights and ChoicesYou have the following rights regarding your personal information:Access: Request a copy of the information we hold about you.Correction: Request corrections to any inaccurate or incomplete information.Deletion: Request the deletion of your personal information.Opt-out: Unsubscribe from marketing communications by following the instructions in the emails we send or by contacting us directly.Children\'s Privacy Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If you believe we have collected such information, please contact us to have it removed.Changes to This Privacy PolicyWe may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the effective date. Your continued use of the app after any changes signifies your acceptance of the updated policy. Contact Us if you have any questions or concerns about this Privacy Policy or our data practices, please contact us at \n[privacy@yourcompany.com].\nEffective Date: 22/03/2024 '),
               
              ],
            )),
      ),
    );
  }

  Widget widget(title, text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
