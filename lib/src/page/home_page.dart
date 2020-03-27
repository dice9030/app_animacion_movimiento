import 'package:flutter/material.dart';
import 'dart:math' as Math; 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dc'),
      ),
      body: CuadradoAnimado(),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;


  @override
  void initState() {
    controller = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 4000)
    );
    // rotacion = Tween(begin: 0.0,end: 2 * Math.pi ).animate(controller);
    rotacion = Tween(begin: 0.0,end: 2 * Math.pi ).animate(
      CurvedAnimation(
        parent: controller,curve: Curves.easeOut
      )
    );

    // opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
       CurvedAnimation(
        parent: controller,curve: Interval(0,0.25, curve: Curves.easeOut)
      )
    );

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
       CurvedAnimation(
        parent: controller,curve: Interval(0.75,1, curve: Curves.easeOut)
      )
    );




    // moverDerecha = Tween(begin: 0.0, end: 200.0).animate(controller);
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,curve: Curves.easeOut
      )
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,curve: Curves.easeOut
      )
    );

    controller.addListener((){

      // Estatus de la animacion
      // print('Status: ${ controller.status  } ');

      if( controller.status == AnimationStatus.completed){
        // controller.reverse();
        controller.reset();
        // controller.repeat();
      } 
      // else if( controller.status == AnimationStatus.dismissed ){
      //   controller.forward();
      // }



    });
    super.initState();
  }

  @override
  void dispose() {
    //Limpiar el controller
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    //Play / reproduccion
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
       child: _Cuadrado(),
      builder: (BuildContext context, Widget child){   

        print('Opacidad: ${ opacidad.status  } ');
        print('Opacidad: ${ opacidad.value  } ');
        print('Rotacion: ${ rotacion.status  } ');
        print('Rotacion: ${ rotacion.value  } ');

        return Transform.translate(
            offset: Offset(moverDerecha.value, 0),
                  child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                  scale: agrandar.value,
                  child: child
                  )
            ),
          ),
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