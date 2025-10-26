import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/budgets/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rashodomer',
      routerConfig: GoRouter(
        initialLocation: '/budgets',
        routes: [...BudgetRoutes.routers],
        errorBuilder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text("error")),
          body: Center(child: Text(state.error.toString())),
        ),
      ),
    );
  }
}
