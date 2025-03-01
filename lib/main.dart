import 'package:flutter/material.dart';
import 'screens/quote_screen.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuoteScreen(),
    );
  }
}
