import 'package:flutter/material.dart';
import '../../../core/services/splash_services.dart';
import '../../../l10n/app_localizations.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices(); 
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.splashScreen,
          style: Theme.of(context).textTheme.displayMedium, 
        ),
      ),
    );
  }
}
