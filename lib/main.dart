import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date!),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}