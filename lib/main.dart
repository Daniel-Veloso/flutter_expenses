import 'package:flutter/material.dart';

main(){
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget{
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Center(
        child: Text('Versão Inicial'),
      ),
    );
  }

}