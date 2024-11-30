import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:adhikar2_o/widgets/bottombar.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:adhikar2_o/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool loading =false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      loading=true;
    });
    String res = await AuthServices()
        .login(email: emailController.text, password: passwordController.text);
    if (res == 'success') {
      setState(() {
        loading=false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return BottomBar();
      }));
      showSnackbar(context, 'Welcom back ${emailController.text}');
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
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Login to your account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'It\'s great to see you again',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
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
                Row(
                  children: [
                    const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const ForgotPasswordScreen();
                        // }));
                      },
                      child: const Text(
                        'Reset password',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (loginFormKey.currentState!.validate()) {
                      loginUser();
                    }
                  },
                  child: const CustomButton(
                    text: 'Login',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    )
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
