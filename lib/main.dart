import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/constant/constant.dart';
import 'package:lista_de_tarefas/loginPage/loginComGoogle.dart';
import 'package:lista_de_tarefas/loginPage/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lista_de_tarefas/pages/toto_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<LoginComGoogle>(
  create: (context) =>
    LoginComGoogle(), builder: (context, child) => MaterialApp (
      debugShowCheckedModeBanner: false,
      title: "Lista de Tarefas",
      home: LoginPage(),
      routes: {
        ConstantRouts.HOME: (context) => LoginPage(),
        ConstantRouts.LISTA_DE_TAREFAS: (context) => TodoListPage(),
      },
  ),
  );
}




