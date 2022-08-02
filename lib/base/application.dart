import 'package:base_flutter/config/router/router.dart';
import 'package:base_flutter/config/theme/app_theme.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;
    return MaterialApp.router(
      theme: AppTheme.light,
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ar", "SA"),
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      // onGenerateTitle: (context) => context.l10n.appName,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
