import 'package:citylab/product/navigation/navigation_constants.dart';
import 'package:citylab/product/navigation/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: NavigationConstants.HOME_VIEW,
    );
  }
}