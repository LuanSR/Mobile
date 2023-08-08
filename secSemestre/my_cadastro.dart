// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mycadastro extends StatefulWidget {
  const Mycadastro({super.key});

  @override
  State<Mycadastro> createState() => _MycadastroState();
}

class _MycadastroState extends State<Mycadastro> {
  String nome = "";
  int ra=0;
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column (children: [
        SizedBox(
          height: 50,
        ),
        Form(
          key: formkey,
          child: Column(children: [
            TextFormField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                fillColor: Colors.amber,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
              controller: campoRa,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value!.isEmpty)
                {
                  return ("O RA não pode ser vazio");
                }
                else
                {
                  if (int.parse(campoRa.text)<10)
                  {
                    return ("O RA deve ser maior que 10");
                  }
                }
                return null;
              },

            ),
            
            TextFormField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                fillColor: Colors.amber,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
              controller: campoNome,
              validator: (value) {
                if (value!.isEmpty)
                {
                  return ("O nome não pode ser vazio");
                }
                else
                {
                  if(campoNome.text.length < 5)
                  {
                      return ("O nome precisa ter mais que 5 caracteres");
                  }
                }
                return null;
              },
            )
          ],),
        ),
        ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate())
            {
              mostrarMsgSucesso();
            ra = int.parse(campoRa.text);
            nome = campoNome.text;
            setState(() {

            });
            }

          }, child: Text("Cadastrar"),),
          Text("Valores digitados: $ra, $nome"),
      ]),)
    );
  }

  void mostrarMsgSucesso()
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Aluno cadastrado com sucesso")));
  }
}