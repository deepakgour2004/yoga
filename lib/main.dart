import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/provider/page_index_provider.dart';
import 'package:yoga/yoga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageIndexProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yoga App',
        home: YogaUi(),
      ),
    );
  }
}
