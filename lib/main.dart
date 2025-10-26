import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:go_router/go_router.dart';

import 'pages/budgets/routes.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = GoRouter(
    initialLocation: '/budgets',
    routes: [...BudgetRoutes.routers],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text("error")),
      body: Center(child: Text(state.error.toString())),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Rashodomer', routerConfig: _router);
  }
}
