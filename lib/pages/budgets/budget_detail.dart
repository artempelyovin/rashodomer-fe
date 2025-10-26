import 'package:flutter/material.dart';

class BudgetDetailPage extends StatelessWidget {
  final String budgetId;

  const BudgetDetailPage({super.key, required this.budgetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Бюджеты")),
      body: Center(child: Text("Вкладка с бюджетом $budgetId")),
    );
  }
}
