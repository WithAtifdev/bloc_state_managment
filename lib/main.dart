import 'package:flutter/material.dart';
import 'core/res/theme/dark_theme.dart';
import 'core/res/theme/light_theme.dart';
import 'core/utils/routers/routes.dart';
import 'core/utils/routers/routes_name.dart';
import 'dependency_injection/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

 ServiceLocator dependencyInjector = ServiceLocator();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjector.servicesLocator();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark, 
      theme: lightTheme, 
      darkTheme: darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), 
        Locale('es'), 
      ],
      initialRoute: RoutesName.home, 
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


