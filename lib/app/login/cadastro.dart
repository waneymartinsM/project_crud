import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_crud/profile_screen.dart';
//import 'package:project_crud/usuario.dart';
import 'package:project_crud/widgets/alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController =  TextEditingController();
  final senhaController = TextEditingController();
  final telController = TextEditingController();

  String groupValueSexo = "";
  String groupValue = "";
  bool carregando = false;


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: carregando == true
                ? CircularProgressIndicator()
                : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nome",
                    //icon: Icon(Icons.person),
                  ),
                  controller: nomeController,
                ),
                const SizedBox(height: 10.0,),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  controller: emailController,
                ),
                const SizedBox(height: 10.0,),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "CPF",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  controller: cpfController,
                ),
                const SizedBox(height: 10.0,),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Telefone",
                  ),
                  controller: telController,

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),

                const SizedBox(height: 10.0,),

                const Text(
                  "Estado civil",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),

                SizedBox(
                  height: 110,
                  child: Card(
                    child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: "Casado(a)",
                                    groupValue: groupValue,
                                    onChanged: (value){
                                      setState(() {
                                        groupValue = value as String;
                                      });
                                    }
                                ),

                                const Text(
                                  "Casado(a)",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "Solteiro(a)",
                                    groupValue: groupValue,
                                    onChanged: (value){
                                      setState(() {
                                        groupValue = value as String;
                                      });
                                    }
                                ),

                                const Text(
                                  "Solteiro(a)",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "Divorciado(a)",
                                    groupValue: groupValue,
                                    onChanged: (value){
                                      setState(() {
                                        groupValue = value as String;
                                      });
                                    }
                                ),

                                const Text(
                                  "Divorciado(a)",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "Viúvo(a)",
                                    groupValue: groupValue,
                                    onChanged: (value){
                                      setState(() {
                                        groupValue = value as String;
                                      });
                                    }
                                ),

                                const Text(
                                  "Viúvo(a)",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ),

                const SizedBox(height: 10.0,),

                const Text(
                  "Sexo",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),

                SizedBox(
                  height: 110.0,
                  child: Card(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "Feminino",
                                  groupValue: groupValueSexo,
                                  onChanged: (value){
                                    setState(() {
                                      groupValueSexo = value as String;
                                    });
                                  }
                              ),

                              const Text(
                                "Feminino",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "Masculino",
                                  groupValue: groupValueSexo,
                                  onChanged: (value){
                                    setState(() {
                                      groupValueSexo = value as String;
                                    });
                                  }
                              ),

                              const Text(
                                "Masculino",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "Outro(s)",
                              groupValue: groupValueSexo,
                                  onChanged: (value){
                                    setState(() {
                                      groupValueSexo = value as String;
                                    });
                                  }
                              ),

                              const Text(
                                "Outro(s)",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0,),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Senha",
                  ),
                  controller: senhaController,
                ),
                const SizedBox(height: 10.0,),


                TextButton(
                  onPressed: (){
                    if(nomeController.text.isEmpty){
                      alertDialog(context, AlertType.info, "Atenção", "Insira o seu nome");
                    }
                    else if(emailController.text.isEmpty){
                      alertDialog(context, AlertType.info, "Atenção", "Insira o seu email");
                    }
                    else if(EmailValidator.validate(emailController.text) == false){
                      alertDialog(context, AlertType.info, "Atenção", "Email é inválido!");
                    }

                    else if(CPFValidator.isValid(cpfController.text) == false){
                      alertDialog(context, AlertType.info, "Atenção", "CPF inválido!");
                    }
                    else if(telController.text.isEmpty){
                      alertDialog(context, AlertType.info, "Atenção", "Insira seu telefone");
                    }
                    else if(telController.text.length < 13){
                      alertDialog(context, AlertType.info, "Atenção", "Número de telefone inválido!");
                    }
                    else if(groupValue.isEmpty){
                      alertDialog(context, AlertType.info, "Atenção", "Selecione seu estado civil!");
                    }

                    else if(senhaController.text.isEmpty){
                      alertDialog(context, AlertType.info, "Atenção", "Insira sua senha");
                    }
                    else if(senhaController.text.length < 7){
                      alertDialog(context, AlertType.info, "Atenção", "Sua senha tem menos de 7 caracteres");
                    }
                    else{
                      setState(() {
                        carregando = true;
                      });


                      //Salvando no firebase
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: senhaController.text

                      ).then((value){

                        /// Cadastro Firestore
                        /// FirebaseAuth.instance.currentUser.uid
                        FirebaseFirestore.instance.collection("usuarios").doc(value.user!.uid).set({
                          "id": value.user!.uid,
                          "nome": nomeController.text,
                          "email": emailController.text,
                          "cpf": cpfController.text,
                          "telefone": telController.text,
                          "estado_civil": groupValue,
                          "sexo": groupValueSexo,
                          "senha" : senhaController.text
                        });
                      });

                      /*
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()
                          ), (route) => false
                      );
                      */

                      setState(() {
                        carregando = false;
                      });
                    }
                    },

                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}