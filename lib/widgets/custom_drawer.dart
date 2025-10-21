import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffff7f00),
                  Color(0xffff9940)
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/LogoMathGamesApp.png"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.manage_accounts_outlined,
                    size: 28,
                    color: Color(0xB3272020),
                  ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Perfil",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xB3272020),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Início selecionado")),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 28,
                    color: Color(0xB3272020),
                  ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xB3272020),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Início selecionado")),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.attach_money,
                    size: 28,
                    color: Color(0xB3272020),
                  ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Plano Pago",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xB3272020),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Início selecionado")),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.stacked_bar_chart,
                    size: 28,
                    color: Color(0xB3272020),
                  ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Estatísticas",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xB3272020),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Início selecionado")),
                    );
                  },
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 28,
                    color: Color(0xB3272020),
                  ),
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Sair",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xB3272020),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Início selecionado")),
                    );
                  },
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
