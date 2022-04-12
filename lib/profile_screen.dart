import 'package:flutter/material.dart';
import 'package:project_crud/app/login/login_screen.dart';
import 'package:project_crud/edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ],
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Menu",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Editar perfil',
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).accentColor),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditScreen()));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Sair',
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).accentColor),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12.0,),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(5, 5),),
                      ]
                  ),
                  child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                ),

                const Padding(
                  padding: EdgeInsets.only(left:8.0, bottom: 4.0, top: 10.0),
                  child: Text(
                    "Informações do usuário",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                Card(
                  child: SizedBox(
                    height: 350,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.person_pin),
                          title: Text("Nome"),
                          subtitle: Text("Waney Martins"),
                        ),
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text("waneymartins@hotmail.com"),
                        ),
                        ListTile(
                          leading: Icon(Icons.person_pin_circle_outlined),
                          title: Text("CPF"),
                          subtitle: Text("126.656.416-07"),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("Telefone"),
                          subtitle: Text("(38)98819-0693"),
                        ),
                        ListTile(
                          leading: Icon(Icons.people_alt_outlined),
                          title: Text("Estado civil"),
                          subtitle: Text("Solteiro(a)"),
                        ),
                        ListTile(
                          leading: Icon(Icons.person_sharp),
                          title: Text("Sexo"),
                          subtitle: Text("Feminino"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}