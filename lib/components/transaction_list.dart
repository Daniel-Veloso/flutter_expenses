import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions!.isEmpty? Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Nenhuma Transação Cadastrada!',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: transactions!.length,
        itemBuilder: (ctx, index){
          final tr = transactions![index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${tr.value}'),
                  ),
                ),
              ),
              title: Text(
                tr.title.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date as DateTime),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onRemove(tr.id as String),
                  color: Theme.of(context).errorColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
