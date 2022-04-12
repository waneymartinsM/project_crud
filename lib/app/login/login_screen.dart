import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_crud/app/login/cadastro.dart';
import 'package:project_crud/profile_screen.dart';
import 'package:project_crud/services/auth_service.dart';
import 'package:project_crud/widgets/alert.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool carregando = false;
  bool ocultarSenha = true;


  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  ///mudar para home screen
  carregardados() async {
    setState(() {
      emailController.text = "";
    });
  }

  @override
  void initState() {
    //setFormAction(true);
    carregardados();
    super.initState();
  }



  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    try{
      await context.read<AuthService>().login(emailController.toString(),senhaController.toString());
    } on AuthException catch(e){
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(
            content: Text("erro"),
          ));
    }
  }

  registrar() async{
    try{
      await context.read<AuthService>().login(emailController.toString(),senhaController.toString());
    } on AuthException catch(e){
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(
            content: Text("erro"),
          ));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: carregando
              ? const CircularProgressIndicator()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.0,
                child: Image.asset(
                    "imagem/loginImagem.png"
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                  ),
                  controller: emailController,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: TextFormField(
                  obscureText: ocultarSenha,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          if (ocultarSenha == true) {
                            setState(() {
                              ocultarSenha = false;
                            });
                          }
                          else {
                            setState(() {
                              ocultarSenha = true;
                            });
                          }
                        },
                        icon: Icon(
                            ocultarSenha == true ? Icons.remove_red_eye : Icons
                                .close)
                    ),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Senha",
                  ),
                  controller: senhaController,
                ),
              ),

              const SizedBox(height: 10.0,),

              TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 85.0
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        alertDialog(context, AlertType.info, "Atenção",
                            "Insira o seu email");
                      }
                      else if (senhaController.text.isEmpty) {
                        alertDialog(context, AlertType.info, "Atenção",
                            "Insira sua senha");
                      }
                      else {
                        setState(() {
                          carregando = true;
                        });

                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: senhaController.text
                        ).then((value) {
                          if (value.user != null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    //builder: (_) => HomeScreen()
                                    builder: (_) => ProfileScreen()
                                ),
                                    (route) => false);
                          }
                        });

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()
                            ), (route) => false
                        );

                        setState(() {
                          carregando = false;
                        });
                      }
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16.00),
                          child:
                          Text(
                            "Entrar",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),


              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const Cadastro()
                      )
                  );
                },
                child: const Text(
                  "Novo",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}