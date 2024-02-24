import 'package:flutter/material.dart';
import 'package:notary_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'features/home/page/homepage.dart';
import 'features/home/provider/home_provider.dart';

void main(){
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomePageProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notary App",
      debugShowCheckedModeBanner: false,
      theme: kThemeData,
      home: const HomePage(),
    );
  }
}
