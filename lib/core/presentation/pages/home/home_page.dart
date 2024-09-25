import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/l10n/app_localizations.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello home");

    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Text(
          AppLocalizations.of(context).helloWorld,
        ),
      ),
    );
  }
}
