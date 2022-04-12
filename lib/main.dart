import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_crud/app/home/home_screen.dart';
import 'package:project_crud/app/login/login_screen.dart';
//import 'package:project_crud/services/auth_service.dart';
//import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    //MultiProvider(
        //providers: [
          //hangeNotifierProvider(create: (context) => AuthService()),
        //],
      //child: const
        MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
        debugShowCheckedModeBanner: false
    );
  }
}



/*
class TestModel extends StatefulWidget {
  const TestModel({Key? key}) : super(key: key);

  @override
  _TestModelState createState() => _TestModelState();
}

class _TestModelState extends State<TestModel> {
  carregarDados(){
    UsuarioModel usuarioModel = UsuarioModel();
    usuarioModel.nome = "asdf";
    usuarioModel.email = "asdf@gmnail";
    usuarioModel.telefone = "99999999999";
    usuarioModel.cpf = "2132541365 ";
    salvarDados(usuarioModel);
  }

  salvarDados(UsuarioModel usuarioModel){
    print(usuarioModel.nome);
    print(usuarioModel.cpf);
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/