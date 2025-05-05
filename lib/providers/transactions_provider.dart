import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/models/transaction.dart';

final transactionsProvider = Provider<List<Transaction>>((ref) => [
  Transaction(amount: 19.99, date: DateTime(2025, 5, 1), status: TransactionStatus.successful),
  Transaction(amount:  7.50, date: DateTime(2025, 5, 2), status: TransactionStatus.pending),
  Transaction(amount: 12.00, date: DateTime(2025, 5, 3), status: TransactionStatus.successful),
  Transaction(amount:  3.99, date: DateTime(2025, 5, 4), status: TransactionStatus.failed),
  Transaction(amount: 99.95, date: DateTime(2025, 5, 5), status: TransactionStatus.pending),
]);

final filterProvider = StateProvider<FilterOption>((ref) => FilterOption.all);

final filteredTransactionsProvider = Provider<List<Transaction>>((ref) {
  final filter = ref.watch(filterProvider);
  final all = ref.watch(transactionsProvider);
  switch (filter) {
    case FilterOption.successful:
      return all.where((t) => t.status == TransactionStatus.successful).toList();
    case FilterOption.pending:
      return all.where((t) => t.status == TransactionStatus.pending).toList();
    case FilterOption.failed:
      return all.where((t) => t.status == TransactionStatus.failed).toList();
    case FilterOption.all:
      return all;
  }
});
