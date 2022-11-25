import 'package:expenses/models/transaction.dart';
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
  final _transaction = [
    Transaction(
      id: 't1', 
      title: 'novo tenis de corrida', 
      value: 310.76, 
      date: DateTime.now()
      ),
      Transaction(
      id: 't2', 
      title: 'conta de luz', 
      value: 211.30, 
      date: DateTime.now()
      ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transaction.map((tr) {
              return Card(
                child: Text(tr.title!),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}