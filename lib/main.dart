import 'package:flutter/material.dart';
import 'package:malsan_plc/utils/size.dart';
import 'package:malsan_plc/utils/thems.dart';

import 'UI/screen/home_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return MaterialApp(
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}