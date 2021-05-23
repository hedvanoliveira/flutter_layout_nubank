import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PayOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            body: SafeArea(
              child: 
                Column(
                  children: 
                  [
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
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ]
                                )
                    ),
                            Flexible(
                              flex: 1,
                              child: 
                                Center(
                                    child: Container(
                                padding: EdgeInsets.all(10),
                                child: ListTile(
                                  minLeadingWidth: 0,
                                  horizontalTitleGap: 10,
                                  //contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      leading: Icon(
                                        Icons.credit_card,
                                        color: Color.fromRGBO(138, 5, 190, 30),
                                        semanticLabel: "title",
                                      ),
                                      title: Text(
                                        "Pagar fatura do cartão",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "Libere o limite do seu Cartão de Crédito",
                                        style: TextStyle(color: Colors.grey[600]),
                                      ),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.grey,
                                        semanticLabel: "title",
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ),
                               Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            Flexible(
                                flex: 1,
                                child: 
                              Center(
                                child: Container(
                                padding: EdgeInsets.all(10),
                                child: ListTile(
                                  minLeadingWidth: 0,
                                  horizontalTitleGap: 10,
                                  //contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  leading: Icon(
                                    Icons.ballot_rounded,
                                    color: Color.fromRGBO(138, 5, 190, 30),
                                    semanticLabel: "title",
                                  ),
                                  title: Text(
                                    "Pagar um boleto",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Contas de luz, água, etc",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.grey,
                                    semanticLabel: "title",
                                  ),
                                  onTap: () {},
                                ),
                            ),
                              ),
                      )
                    ],
                  )
                  
              )
            )
        
    );  
  }
}
