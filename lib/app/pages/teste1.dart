import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Teste1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(color: Colors.red, width: 150, height: 150,),
                    Text("Column 1"),
                    Text("Column 2"),
                    Text("Column 3"),
                    Container(color: Colors.orange, width: 20, height: 20,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //mainAxisSize: MainAxisSize.min,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(color: Colors.black, width: 150, height: 150,),
                    Text("Row 1", style: TextStyle(fontFamily: "Graphik"),),
                    Text("Row 2"),
                    Text("Row 3"),
                    Container(color: Colors.black, width: 20, height: 20,),
                  ],)
                ],),
              )
          ),
        )
    );
  }
}
