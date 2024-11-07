import 'package:adhikar2_o/firebase_options.dart';
import 'package:adhikar2_o/provider/lawyerProvider.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/verifyLawyers.dart';
import 'package:adhikar2_o/utils/constants.dart';
import 'package:adhikar2_o/widgets/bottombar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBYlugEpQpajAepJ4Z4qOLD9s7jV7XiRC4",
      projectId: "adhikar2-o",
      storageBucket: "adhikar2-o.appspot.com",
      messagingSenderId: "327700232063",
      appId: "1:327700232063:web:af2096a9c1ec8c8c4a8c4a",
    ));
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  Gemini.init(apiKey: Gemini_api);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LawyerProvider())
      ],
      child: MaterialApp(
          title: 'Adhikar',
          theme: ThemeData(
            colorScheme: const ColorScheme.light(),
          ),
          debugShowCheckedModeBanner: false,
          home: LayoutBuilder(builder: (context, Constraints) {
            if (Constraints.maxWidth > 1400) {
              return VerifyLawyersScreen();
            } else {
              return BottomBar();
            }
          })

          // home: LoginScreen(),
          ),
    );
  }
}
