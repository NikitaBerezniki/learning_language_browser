import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/readable_provider.dart';
import 'models/settings_app_provider.dart';
import 'resources/app_theme.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SettingsAppProvider()),
            ChangeNotifierProvider(
            create: (BuildContext context) => ReadableProvider()),
      ],
      child: Consumer<SettingsAppProvider>(builder: (_, appModel, __) {
        return MaterialApp(
          title: 'Learning language browser',
          debugShowCheckedModeBanner: false,
          theme: appThemeLight(context),
          home: MainScreen(),
        );
      }),
    );
  }
}
