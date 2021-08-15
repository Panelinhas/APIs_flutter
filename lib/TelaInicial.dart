import 'package:doceria/Cadastro.dart';
import 'package:doceria/Cardapio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:doceria/VisiteNos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Post.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  abrirYoutube() async{
    await launch('https://www.youtube.com/watch?v=EbWfUW2qs1Q&list=PL225bd3FUlp2Gbh3fmxla2M9GtGfQJFyV&ab_channel=VinniCoffee');
  }

  List<Post> postagens = [];

  Future<List<Post>> _recuperarObjetos () async {
    var url = Uri.https('gist.githubusercontent.com', '/marlondev-me/8fe7284146f01d39f3355a663236b88b/raw/68ce1ad807e3a108d5a35d47e7d079cdd8247026/1596541974.685423__recipes_.json');
    http.Response response = await http.get(url);
    var respostas = json.decode(response.body);
    for(var resposta in respostas) {
      Post p = Post(resposta["receitas_id"], resposta["receitas_nome"], resposta["receitas_ingredientes"], resposta["receitas_fk_cat_desc"]);
      postagens.add(p);
    }
    print(postagens.length);
    print(response.statusCode);
    return Navigator.push(context, MaterialPageRoute(builder: (context) => Cardapio(postagens)));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pinkAccent ,
          title: Text(
            'Coffee House Doceria',
            style: TextStyle(
                color: Colors.grey.shade800 ,
                fontSize: 30
            ),
          ),
        ),

        body: SingleChildScrollView(

          child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Center(
                    child: Text("Bem vindos!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 28
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only (top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VisiteNos()));
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  (
                                  'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.contain ,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text("Visite-nos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),


                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  (
                                    'https://images.pexels.com/photos/6969810/pexels-photo-6969810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.contain ,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text("Cadastre-se",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                             await _recuperarObjetos();
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  (
                                    'https://images.pexels.com/photos/2128109/pexels-photo-2128109.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.contain,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text("Cardápio",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),


                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              abrirYoutube();
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  (
                                    'https://images.pexels.com/photos/4350063/pexels-photo-4350063.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.contain,
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text("Receitas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  ),
                ),

              ]
          ),
        )
    );
  }
}