import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  String _msgFinal = '';

  TextEditingController _controladorNome = TextEditingController();
  TextEditingController _controladorCPF = TextEditingController();
  TextEditingController _controladorEndereco = TextEditingController();
  TextEditingController _controladorTelefone = TextEditingController();
  TextEditingController _controladorEmail = TextEditingController();

  CollectionReference pessoas = FirebaseFirestore.instance.collection('pessoas');

  Future<void> adicionarPessoa() {
    return pessoas.add({
      'nome':_controladorNome.text.toString(),
      'CPF':_controladorCPF.text.toString(),
      'endereco':_controladorEndereco.text.toString(),
      'telefone':_controladorTelefone.text.toString(),
      'Email':_controladorEmail.text.toString()
    })
        .then((value) => _msgFinal = 'Pessoa adicionada com sucesso!')
        .catchError((onError) => _msgFinal ='Não foi possível inserir!');
  }

  _mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Center(
          child: Text(
            _msgFinal,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          )),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.purpleAccent ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent ,
        title: Text(
          'Cadastro',
          style: TextStyle(
              color: Colors.grey.shade800 ,
              fontSize: 30
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(
                    labelText: 'Nome Completo'
                ),
              ),
              TextField(
                controller: _controladorCPF,
                decoration: InputDecoration(
                    labelText: 'CPF'
                ),
              ),
              TextField(
                controller: _controladorEndereco,
                decoration: InputDecoration(
                    labelText: 'Endereço'
                ),
              ),
              TextField(
                controller: _controladorTelefone,
                decoration: InputDecoration(
                    labelText: 'Telefone'
                ),
              ),
              TextField(
                controller: _controladorEmail,
                decoration: InputDecoration(
                    labelText: 'E-mail'
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    await adicionarPessoa();
                    _mostrarSnackBar();
                  },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent)),
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                        color: Colors.grey.shade800 ,
                        fontSize: 20),
                  ),


              )
            ],
          ),
        ),
      ),

    );
  }
}

