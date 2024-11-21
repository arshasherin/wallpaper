import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_project/screen/wallpaper_screen.dart';

import 'view_ model.dart/wallpaper_vm.dart';



void main() async {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => WallpaperViewModel())],
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
