import 'package:flutter/material.dart';
import '../widgets/filter_bar.dart';
import '../widgets/transaction_list.dart';

class TransactionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction Activity')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Column(
              children: [
               FilterBar(),
                Expanded(flex: 5, child: TransactionList()),
              ],
            );
          } else {
            return Column(
              children: [
                FilterBar(),
                Expanded(child: TransactionList()),
              ],
            );
          }
        },
      ),
    );
  }
}
