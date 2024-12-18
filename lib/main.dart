import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallet_nfc/home.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
