import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:adhikar2_o/widgets/bottombar.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:adhikar2_o/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  bool loading=false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      loading=true;
    });
    String res = await AuthServices().signUp(
        firstName: firstnameController.text,
        lastName: lastnameController.text,
        email: emailController.text,
        type: 'User',
        password: passwordController.text);
    if (res == 'success') {
       setState(() {
      loading=false;
    });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return BottomBar();
      }));
      showSnackbar(context, 'Account created as ${emailController.text}');
    } else {
       setState(() {
      loading=false;
    });
      showSnackbar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading?Center(child: CircularProgressIndicator( color: primaryColor,),): SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Let\'s create your account',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'First Name',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: firstnameController,
                  obsecureText: false,
                  hinttext: 'first name',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Last Name',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: lastnameController,
                  obsecureText: false,
                  hinttext: 'last name',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  obsecureText: false,
                  hinttext: 'email',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obsecureText: true,
                  hinttext: 'password',
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                        text: 'Terms, Privacy Policy and conditions',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ])),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (signUpFormKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                  child: const CustomButton(
                    text: 'Create an account',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
