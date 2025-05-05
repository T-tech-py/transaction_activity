enum TransactionStatus { successful, pending, failed }

class Transaction {
  final double amount;
  final DateTime date;
  final TransactionStatus status;

  Transaction({required this.amount, required this.date, required this.status});
}

enum FilterOption { all, successful, pending, failed }
