import 'package:app_animation_dc/src/page/home_page.dart';
import 'package:app_animation_dc/src/retos/cuadrado_animado.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'Cuadrado',
      routes: {
        'Home': (BuildContext context)=>HomePage(),
        'Cuadrado': (BuildContext context)=>CuadradoAnimadoPage(),     
      },
    );
  }
}