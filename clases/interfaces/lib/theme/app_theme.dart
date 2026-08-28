import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme{
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo);
    
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: 
        colorScheme.surface,
      
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}