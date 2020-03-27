import 'package:flutter/material.dart';
import 'dart:math' as Math; 

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: CuadradoAnimado(),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  @override

  AnimationController controller;
  Animation<double> mover;
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  

  @override
  void initState() { 
    controller = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 4500)
    );

    
    mover = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,curve: Curves.easeOut
      )
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve:Curves.easeOut))
    );

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve:Curves.easeOut))
    );

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve:Curves.easeOut))
    );

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve:Curves.easeOut))
    );

    controller.addListener((){
      if(controller.status == AnimationStatus.completed){
        controller.reset();
      }
    });


    super.initState();
    
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget child){
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: child,
        );
      },
    );
  }
}



class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      );
  }
}