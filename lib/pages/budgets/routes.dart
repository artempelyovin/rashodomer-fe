import 'package:go_router/go_router.dart';

import 'budget_list.dart';
import 'budget_detail.dart';

class BudgetRoutes {
  static final List<RouteBase> routers = [
    GoRoute(
      path: '/budgets',
      builder: (context, state) => BudgetListPage(),
      routes: [
        GoRoute(
          path: ':budgetId',
          builder: (context, state) {
            final budgetId = state.pathParameters['budgetId']!;
            return BudgetDetailPage(budgetId: budgetId);
          },
        ),
      ],
    ),
  ];
}
