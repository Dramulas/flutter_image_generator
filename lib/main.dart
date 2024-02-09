import 'package:dalle_flutter_mobile_app/features/home/view/home_view.dart';
import 'package:dalle_flutter_mobile_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/init/theme/ligth/app_theme_ligth.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bob Ross',
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.instance.theme,
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: const HomeView(),
      ),
    );
  }
}
