import 'package:flutter/material.dart';
import 'package:notary_app/constants/size.dart';

final ThemeData kThemeData = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,inputDecorationTheme: InputDecorationTheme(

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(Sizes.xs),
    borderSide: const BorderSide(color: Colors.black),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(Sizes.xs),
    borderSide: const BorderSide(color: Colors.black),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
)
);