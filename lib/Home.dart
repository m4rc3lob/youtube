import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  int _indiceSelecionado = 0;

  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Incricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [

          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              }
          ),
          /*
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
              }
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceSelecionado],
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado,
        onTap: (indice){
          setState(() {
            _indiceSelecionado = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
           BottomNavigationBarItem(
             title: Text("Início"),
             icon: Icon(Icons.home)
           ),
           BottomNavigationBarItem(
               title: Text("Em alta"),
               icon: Icon(Icons.whatshot)
           ),
           BottomNavigationBarItem(
               title: Text("Inscrições"),
               icon: Icon(Icons.subscriptions)
           ),
            BottomNavigationBarItem(
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            )
         ]
      )
    );
  }
}
