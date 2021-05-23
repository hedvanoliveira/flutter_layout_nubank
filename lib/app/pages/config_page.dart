import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(102, 4, 141, 100),
        systemNavigationBarColor: Color.fromRGBO(138, 5, 190, 30),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(138, 5, 190, 30),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                child: TopHomeConfigWidget(),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.all(15.0),
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              "Agência 0001 Conta 456445-8",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Banco 270 - Nu Pagamento S.A.",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              height: 0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      ListTileItemWidget("Me ajuda", Icons.help_outline),
                      ListTileItemWidget(
                          "Perfil", Icons.account_circle_outlined),
                      ListTileItemWidget("Configuração da conta",
                          Icons.monetization_on_outlined),
                      ListTileItemWidget("Minhas chaves Pix", Icons.qr_code),
                      ListTileItemWidget(
                          "Configurar cartão", Icons.credit_card_outlined),
                      ListTileItemWidget("Pedir conta PJ", Icons.add_business),
                      ListTileItemWidget("Configurar notificações",
                          Icons.mail_outline_outlined),
                      ListTileItemWidget(
                          "Configurações do app", Icons.smartphone_rounded),
                      ListTileItemWidget("Sobre", Icons.help_outline),
                      Divider(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            //your action here
                          },
                          child: Text("SAIR DO APP"),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(width: 0.5, color: Colors.white)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50)),
                            //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                          ))
                    ],
                  ),
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const ListTileItemWidget(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        minLeadingWidth: 0,
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        leading: Icon(icon, color: Colors.white, semanticLabel: title,),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, semanticLabel: title,),
        onTap: () {},
      ),
      Divider(
        color: Colors.white,
        height: 0,
      ),
    ]);
  }
}

class TopHomeConfigWidget extends StatelessWidget {
  const TopHomeConfigWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Olá, Maria",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(152, 36, 199, 100),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                          semanticLabel: 'Fechar',
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ]),
        ],
      ),
    );
  }
}
