import 'package:flutter/material.dart';

import 'Post.dart';

class Cardapio extends StatefulWidget {
  List<Post> postagens;
  Cardapio(this.postagens);

  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  List _itens = [];

  _carregarItens(){
    for(var postagem in widget.postagens){
      Map<String, dynamic> item = Map();
      item["id"] = postagem.id;
      item["nome"] = postagem.nome;
      item["fk_cat_desc"] = postagem.fk_cat_desc;
      item["ingredientes"] = postagem.ingredientes;
      _itens.add(item);
    }
  }


  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent ,
        title: Text(
          'Cardápio',
          style: TextStyle(
              color: Colors.grey.shade800 ,
              fontSize: 30
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.postagens.length,
          itemBuilder: (context, indice){
            return ListTile(
              title: Text(_itens[indice]["id"].toString() + ' - ' +_itens[indice]["nome"].toString()),
              subtitle: Text(_itens[indice]["fk_cat_desc"].toString() + ' - ' +_itens[indice]["ingredientes"].toString()),

            );
          }
      ),

    );
  }
}
