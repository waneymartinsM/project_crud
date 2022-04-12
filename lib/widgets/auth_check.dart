import 'package:flutter/material.dart';
import 'package:project_crud/app/home/home_screen.dart';
import 'package:project_crud/app/login/login_screen.dart';
import 'package:project_crud/services/auth_service.dart';
import 'package:provider/provider.dart';
class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}