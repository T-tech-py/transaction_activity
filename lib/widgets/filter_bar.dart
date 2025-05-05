import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../providers/transaction_providers.dart';

class FilterBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(filterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: FilterOption.values.map((opt) {
        final label = opt.toString().split('.').last;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: ChoiceChip(
            label: Text(label),
            selected: (opt == selected),
            onSelected: (_) => ref.read(filterProvider.notifier).state = opt,
          ),
        );
      }).toList(),
    );
  }
}
