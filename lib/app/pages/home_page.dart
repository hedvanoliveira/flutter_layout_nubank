import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_nubank/app/pages/config_page.dart';
import 'package:flutter_layout_nubank/app/pages/pay_option_page.dart';
import 'package:flutter_layout_nubank/app/pages/pix_page.dart';
import 'package:flutter_layout_nubank/app/pages/teste1.dart';
import 'package:flutter_layout_nubank/app/pages/transfer_page.dart';

enum ListCardItemWTypeEnum {
  cartaoCredito,
  conta,
  emprestimo
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _reloadList() async {
    await Future.delayed(Duration(seconds: 2), () => null);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(102, 4, 141, 100),
          systemNavigationBarColor: Color.fromRGBO(138, 5, 190, 30),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: RefreshIndicator(
          onRefresh: _reloadList,
          child: Scaffold(
            backgroundColor: Color.fromRGBO(138, 5, 190, 30),
            bottomNavigationBar: MenuCardBottomWidget(),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: TopHomeWidget(),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: [
                          ListCardWidget(type: ListCardItemWTypeEnum.cartaoCredito,),
                          ListCardWidget(type: ListCardItemWTypeEnum.conta,),
                          ListCardWidget(type: ListCardItemWTypeEnum.emprestimo,),
                        ],
                      ),
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({
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
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                              size: 30,
                              semanticLabel: 'Visualizar',
                            ), onPressed: () {
                                 //Navigator.push(context, MaterialPageRoute(builder: (context) => Teste1Page()));
                             },
                            ),
                          ),
                            SizedBox(
                      width: 10,
                    ),
                        CircleAvatar(
                              backgroundColor: Color.fromRGBO(152, 36, 199, 100),
                              child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                               Icons.settings_outlined,
                              color: Colors.white,
                              size: 30,
                              semanticLabel: 'Config',
                            ), onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigPage()));
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

class MenuCardBottomWidget extends StatelessWidget {
  const MenuCardBottomWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 10,),
          MenuCardItemBottomWidget("Pix", Icons.shopping_cart_outlined, PixPage()),
          SizedBox(
            width: 7,
          ),
          MenuCardItemBottomWidget("Pagar", Icons.featured_play_list_sharp, PayOptionPage()),
          SizedBox(
            width: 7,
          ),
          MenuCardItemBottomWidget("Indicar Amigos", Icons.person_add_alt, TransferPage()),
          SizedBox(
            width: 7,
          ),
          MenuCardItemBottomWidget("Transferir", Icons.attach_money_outlined, TransferPage()),
           SizedBox(width: 10,),
        ],
      ),
    );
  }
}

class MenuCardItemBottomWidget extends StatelessWidget {

  final String title;
  final IconData icon;
  final Widget page;

  const MenuCardItemBottomWidget(this.title, this.icon, this.page);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        width: 90.0,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: Color.fromRGBO(152, 36, 199, 100),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(title, style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCardWidget extends StatelessWidget {
  
  final ListCardItemWTypeEnum type;

  const ListCardWidget({this.type,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    width: constraints.maxWidth,
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListCardItemTypeWidget(type: type,)
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ListCardItemTypeWidget extends StatelessWidget {
  
  final ListCardItemWTypeEnum type;

  const ListCardItemTypeWidget({this.type, Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ListCardItemWTypeEnum.cartaoCredito:
          return ListCardItemCartaoCreditoWidget();
        break;
      case ListCardItemWTypeEnum.conta:
          return ListCardItemContaWidget();
        break;
      case ListCardItemWTypeEnum.emprestimo:
          return ListCardItemEmprestimoWidget();
        break;
      default:
      return null;
    }
  }
}

class ListCardItemCartaoCreditoWidget extends StatelessWidget {
  const ListCardItemCartaoCreditoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Cartão de Crédito",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text("Fatura do Cartão",
            style:
                TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(
          height: 15,
        ),
        Text("R\$ 200,00",
            style:
                TextStyle(fontSize: 30, color: Colors.blue)),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text("Limite disponível",
                style: TextStyle(
                    fontSize: 14, color: Colors.grey[600])),
            SizedBox(
              width: 10,
            ),
            Text("R\$ 1.220,00",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class ListCardItemContaWidget extends StatelessWidget {
  const ListCardItemContaWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.monetization_on_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Conta",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text("Saldo disponível",
            style:
                TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(
          height: 15,
        ),
        Text("R\$ 350,25",
            style:
                TextStyle(fontSize: 30, color: Colors.black)),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class ListCardItemEmprestimoWidget extends StatelessWidget {
  const ListCardItemEmprestimoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.payments_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Empréstimo",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text("Valor disponível de até",
            style:
                TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(
          height: 5,
        ),
        Text("R\$ 2.000,00",
            style:
                TextStyle(fontSize: 20, color: Colors.black)),
        SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              //your action here
            },
            child: Text("SIMULAR EMPRÉSTIMO"),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(width: 0.5, color: Color.fromRGBO(138, 5, 190, 30),)),
              foregroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(138, 5, 190, 30),),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30)),
              //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
            ))
      ],
    );
  }
}
