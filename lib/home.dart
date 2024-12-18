//cSpell:disable
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_wallet_card/core/passkit.dart';
import 'package:flutter_wallet_card/flutter_wallet_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Flutter Wallet Card'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('월렛을 URL통해 가져오기'),
            const SizedBox(height: 5),
            FutureBuilder(
              future: rootBundle.loadString('./.env'),
              initialData: '',
              builder: (context, snapshot) => CupertinoButton.filled(
                onPressed: () =>
                    _generateWalletPassFromUri(dotenv.get("EXAMPLE_URL")),
                child: const Text('월렛 URL 추가'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _generateWalletPassFromUri(String url) async {
    final passkit = await Passkit().saveFromUri(id: 'example', url: url);
    await FlutterWalletCard.addPasskit(passkit);
  }
}
