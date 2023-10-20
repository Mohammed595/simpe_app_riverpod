import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riferpord_test/Core/Pages/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
