import 'package:flutter/material.dart';

import '../../api/budget_service.dart';
import '../../models/budget.dart';
import '../../widgets/budget_card.dart';

class BudgetListPage extends StatelessWidget {
  final _budgetService = BudgetService();

  BudgetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Бюджеты")),
      body: FutureBuilder<List<Budget>>(
        future: _budgetService.getBudgets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }

          final budgets = snapshot.data ?? [];

          if (budgets.isEmpty) {
            return SizedBox.shrink();
          }

          return ListView.builder(
            itemCount: budgets.length,
            itemBuilder: (context, index) {
              final budget = budgets[index];
              return BudgetCard(budget: budget);
            },
          );
        },
      ),
    );
  }
}
