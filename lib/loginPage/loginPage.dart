import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/constant/constant.dart';
import 'package:lista_de_tarefas/loginPage/loginComGoogle.dart';
import 'package:lista_de_tarefas/pages/toto_list_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailControler = TextEditingController();

  final _senhaControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return TodoListPage();
          } else if(snapshot.hasError) {
            return Center(child: Text("Erro!!!!!"),);
          } else {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(
                top: 60,
                left: 40,
                right: 40,
              ),
              color: Colors.white,
              child: ListView(
                children: [
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset("assets/logo.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        'Recuperar Senha',
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.1 ,5],
                        colors: const [
                          Color(0xff00d7f3),
                          Color(0xff000000),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("assets/adidas.png"),
                                height: 28,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xff00d7f3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Login com Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              child: SizedBox(
                                child: Image.asset("assets/google.png"),
                                width: 28,
                                height: 28,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          final provider = Provider.of<LoginComGoogle>(context, listen: false);
                          provider.googleLogin();
                          if(provider.logado == true) {
                            Navigator.pushNamed(context, ConstantRouts.LISTA_DE_TAREFAS);
                          } else {
                            Navigator.pushNamed(context, ConstantRouts.HOME);
                          }
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        }
      ),
    );
  }
}
