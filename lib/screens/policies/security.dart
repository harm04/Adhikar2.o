import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

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
              children: [
                widget('1', 'Data Encryption',
                    'All data transmitted between your device and our servers is encrypted using Secure Socket Layer (SSL) technology. Additionally, any data stored on our servers is encrypted using Advanced Encryption Standard (AES) encryption to prevent unauthorized access.'),
                const SizedBox(
                  height: 10,
                ),
                widget('2', 'Access Control',
                    'We implement strict access control measures to protect your data: Multi-Factor Authentication (MFA):** Required for all accounts to provide an additional layer of security.Role-Based Access Control (RBAC):** Access to data is limited based on the role and necessity of the user.Regular Audits:** We conduct regular audits to ensure only authorized personnel have access to sensitive information.'),
                const SizedBox(
                  height: 10,
                ),
                widget('3', 'Privacy Policy',
                    'We respect your privacy. For more details on how we handle your data, please read our. Incident ResponseIn the unlikely event of a security breach, we have a comprehensive incident response plan in place:Detection: Continuous monitoring to identify potential threats.Response: Immediate action to mitigate the impact of any breach.Notification: We will promptly inform affected users and provide guidance on protective measures.Third-Party ServicesWe partner with trusted third-party services to enhance our app’s functionality. Each of these partners adheres to stringent security standards to ensure your data remains protected.Compliance and CertificationsOur security practices comply with industry standards and regulations, including: General Data Protection Regulation (GDPR) California Consumer Privacy Act (CCPA)ISO 27001 CertificationContact UsIf you have any questions or concerns about our security measures, or if you suspect a security issue, please contact our security team at [security@yourcompany.com].Updates to Our Security PracticesWe continuously review and update our security measures to keep pace with evolving threats and advancements in technology. Any changes to our security practices will be reflected on this page.User ResponsibilitiesTo further protect your data, we recommend the following:Strong Passwords: Use complex passwords that are difficult to guess.Regular Updates: Keep your app and devices updated with the latest security patches.Secure Devices: Ensure your devices are protected with a PIN, password, or biometric authentication.'),
              ],
            )),
      ),
    );
  }

  Widget widget(pointNum, title, text) {
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
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
