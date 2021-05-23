import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class TransferPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var controller = new MoneyMaskedTextController(leftSymbol: 'R\$ ');
    controller.updateValue(0.00);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            //appBar: AppBar(
            //  centerTitle: true,
            //title: const Text('Skeeper'),
            //  backgroundColor: Colors.white,
            //),
            floatingActionButton: 
            FloatingActionButton(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.grey[200],
              elevation: 0,
              disabledElevation: 0,
              tooltip: "Próximo",
              child: Icon(Icons.arrow_forward, color: Colors.grey,),
              onPressed: () {  },),
            body: SafeArea(
          child: Column(children: [
            Column(children: [
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            tooltip: "Fechar",
                            icon: Icon(
                            Icons.close,
                            color: Colors.grey[800],
                            size: 30,
                            semanticLabel: 'Fechar',
                          ), onPressed: () {
                            Navigator.pop(context);
                           },
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                            Icons.qr_code,
                            color: Color.fromRGBO(102, 4, 141, 100),
                            size: 30,
                            semanticLabel: 'QR Code',
                          ), onPressed: () {
                               //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                           },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      
                      Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Qual é o valor da transferência?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Saldo disponível em conta",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "R\$ 1.110,00",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextField(
                                autofocus: true,
                                controller: controller, keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                showCursor: true,
                                style: TextStyle(fontSize: 35),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize:35, color: Colors.black),
                                    //border: InputBorder.none,
                                    hoverColor: Colors.black,
                                    labelStyle: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    hintText: 'R\$ 0,00'),
                              ),
                            ]),
                      )
                    ],
                  )),
            ])
          ]),
        )));
  }
}
