import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemoved; 
  
  const TransactionList(this.transactions, this.onRemoved, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'VAMOS GASTAR',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'lib/assets/images/anime-icon-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 1,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                            child: Text(
                          'R\$ ${tr.value}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: IconButton(
                      onPressed: () => onRemoved(tr.id),
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
                //  Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //             horizontal: 15, vertical: 10),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).colorScheme.primary,
                //                 width: 2)),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           'R\$ ${tr.value.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).colorScheme.primary,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             tr.title,
                //             style: const TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 16),
                //           ),
                //           Text(
                //             DateFormat('d MMM y').format(tr.date),
                //             style: const TextStyle(color: Colors.grey),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              // children: transactions
              //     .map((tr) => )
              //     .toList(),
            ),
    );
  }
}
