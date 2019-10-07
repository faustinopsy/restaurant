import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Restaurante(),));

class Restaurante extends StatefulWidget {
  @override
  _RestauranteState createState() => _RestauranteState();
}

class _RestauranteState extends State<Restaurante> {
  int _numClientes=0;
  final _lotacao=20;

  _atualizaContagem(int qtd){
    setState(() {
      if(_numClientes +qtd <0){
        _numClientes=0;
      }else if(_numClientes + qtd > _lotacao){
        _numClientes =_lotacao;
      }else{
        _numClientes +=qtd;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
      shadows:[
        Shadow(
          color:Colors.black87,
          offset: Offset(3,3)
        )
      ]
    );

    return Stack(
      children:[ Image.asset('imagens/capa.png',
      fit: BoxFit.cover,
        height: 1000,
        width: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

        Text('Nº de Clientes $_numClientes', style: estilo,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                  color: Color.fromARGB(180, 133, 203, 33),
                  child: Text('+1',style: estilo,),
                  onPressed: (){
                    _atualizaContagem(1);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10,left: 20,bottom: 10),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                        color: Color.fromARGB(180, 233, 233, 33),
                      shadows: [
                        BoxShadow(color:Colors.black45, offset: Offset(3, 3))
                      ]
                    ),
                  ),
                ),
                FlatButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                  color: Color.fromARGB(200, 183, 03, 33),
                  child: Text('-1',style: estilo,),
                  onPressed: (){
                    _atualizaContagem(-1);
                  },
                ),
                Container(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.red,
                      shadows: [
                        BoxShadow(color:Colors.black45, offset: Offset(3, 3))
                      ]
                  ),
                ),
              ],
          ),
            Text(_numClientes < _lotacao
            ? 'Sejam bem vindos' : 'Lotado',style: estilo,
            )
          ],
        )
      ],
    );
  }
}

