import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'UserScreens/Payment/KhaltiTest.dart';

void main() {
  runApp(const Myapp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_5a22ad67e707441b8362fc7bed556a8d',
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: KhaltiPayment(),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ]);
        });
  }
}
