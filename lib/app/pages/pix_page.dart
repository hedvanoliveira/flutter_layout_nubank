import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_nubank/app/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PixPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            body: SafeArea(
          child: Column(children: [
              Container(
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
                        ],
                      ),
                    ]
                  ),
              ),
                SizedBox(
                  height: 0,
                ),
                Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child:
                      ListView(
                        padding: EdgeInsets.all(0),
                            children: [
                              Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("assets/transfer_money.svg", width: MediaQuery.of(context).size.width/2,),
                                 SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Minha área Pix",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Tudo o que você precisa para pagar, transferir ou cobrar.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.normal),
                                ),
                                  SizedBox(
                                  height: 30,
                                ),
                              ],
                              ),
                              ),
                              Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    OptionItemWidget(title: "Pagar", icon: Icons.qr_code_sharp,),
                                    OptionItemWidget(title: "Tranferir", icon: Icons.fact_check_rounded,),
                                    OptionItemWidget(title: "Cobrar", icon: Icons.monetization_on_outlined,),
                                    ]),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  color: Colors.grey[300],
                                  child: Column(
                                    children: [
                                      Divider(
                                          color: Colors.grey[500],
                                          height: 2,
                                        ),
                                        ListTileItemWidget(title: "Minhas chaves", icon: Icons.vpn_key_outlined),
                                        ListTileItemWidget(title: "Meu limite Pix", icon: Icons.settings),
                                        ListTileItemWidget(title: "Minha ajuda", icon: Icons.help_outline_outlined),
                                ],)
                                ,)
                                ]  
                              ),
                        )
                            ],
                      )
                )
                      )
                    ],
                  ),
            )
          ),
        );
  }
}

class OptionItemWidget extends StatelessWidget {

  final String title;
  final IconData icon;

  const OptionItemWidget({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector
                  (
                    behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: 
     Container(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CircleAvatar(
                      radius: 40,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                          icon,
                          color: Colors.black,
                          size: 30,
                          semanticLabel: title,
                        ), onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Teste1Page()));
                        },
                        ),
                      ),
                  
                    SizedBox(height: 10,),
                    Text(title, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
        ),
                  )));
  }
}

class ListTileItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const ListTileItemWidget({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ListTile(
        minLeadingWidth: 0,
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        leading: Icon(icon, color: Colors.black, semanticLabel: title,),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, semanticLabel: title,),
        onTap: () {},
      ),
      
    ]);
  }
}