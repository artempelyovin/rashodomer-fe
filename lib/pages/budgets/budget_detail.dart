import 'package:flutter/material.dart';
import 'package:rashodomer/api/budget_service.dart';
import 'package:rashodomer/models/budget.dart';
import 'package:rashodomer/widgets/budget_card.dart';

class BudgetDetailPage extends StatelessWidget {
  final String budgetId;
  final _budgetService = BudgetService();

  BudgetDetailPage({super.key, required this.budgetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SelectableText("Редактирование бюджета")),
      body: SingleChildScrollView(
        child: FutureBuilder<Budget>(
          future: _budgetService.getBudget(budgetId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            }

            final budget = snapshot.data;

            if (budget == null) {
              return Center(
                child: Text('Не удалось загрузить бюджет $budgetId'),
              );
            }

            return BudgetDetailCard(budget: budget);
          },
        ),
      ),
    );
  }
}
