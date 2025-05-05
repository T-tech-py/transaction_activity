import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/transaction_providers.dart';

class TransactionList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);
    final filteredTx = ref.watch(filteredTransactionsProvider);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: filteredTx.isNotEmpty
        ? ListView.builder(
            key: ValueKey(filter),
            itemCount: filteredTx.length,
            itemBuilder: (context, i) {
              final tx = filteredTx[i];
              return ListTile(
                title: Text('\$${tx.amount.toStringAsFixed(2)}'),
                subtitle: Text(DateFormat.yMd().format(tx.date)),
                trailing: Text(tx.status.toString().split('.').last),
              );
            },
          )
        : Center(
            key: ValueKey('empty_\$filter'),
            child: Text('No transactions found.'),
          ),
    );
  }
}
