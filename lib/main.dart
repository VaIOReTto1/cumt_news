import 'package:cumt_news/page/person_page/person_page.dart';
import 'package:cumt_news/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(){
  runApp((MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
