import 'package:flutter/material.dart';
import 'package:rashodomer/widgets/budget_card.dart';

import 'models/budget.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Привет, Flutter!')),
        body: ListView(
          children: [
            BudgetCard(
              budget: Budget(
                id: "8bc54957-bc0e-4d03-9b20-5e020193c064",
                name: "Наличные и дебитовые карты",
                description: "Все мои деньги в нале и на картах",
                amount: 10000,
                emojiIcon: '💵',
                userId: "6f7eaede-853f-4830-a7c2-85187ed8077",
              ),
              user: null,
            ),
            BudgetCard(
              budget: Budget(
                id: 'c904214c-037c-4a7e-a802-1dc94c074701',
                name: "Доллары",
                description: "Все мои купленные доллары",
                amount: 250,
                emojiIcon: null,
                userId: "6f7eaede-853f-4830-a7c2-85187ed8077",
              ),
              user: User(
                id: '6f7eaede-853f-4830-a7c2-85187ed8077',
                first_name: 'Артём',
                last_name: 'Пелёвин',
                login: 'artem.pelyovin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
