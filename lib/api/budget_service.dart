import 'dart:math';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

import '../models/budget.dart';

class BudgetService {
  final _faker = Faker();
  final _uuid = Uuid();
  final _random = Random();

  Budget _generateBudget(String budgetId) {
    const emojiList = [
      '💰',
      '🏦',
      '🧾',
      '💳',
      '🪙',
      '📈',
      '🏠',
      '🍽️',
      '🚗',
      '🎒',
      '🛒',
    ];
    return Budget(
      id: budgetId,
      name: '${_faker.person.firstName()} ${_faker.person.lastName()}',
      description: _faker.lorem.sentences(1).join(" "),
      amount: _random.nextInt(500000).toDouble(),
      emojiIcon: _random.nextBool()
          ? emojiList[_random.nextInt(emojiList.length)]
          : null,
      userId: _uuid.v4(),
    );
  }

  Future<Budget> getBudget(String budgetId) async {
    await Future.delayed(Duration(milliseconds: 5 + _random.nextInt(50)));
    return _generateBudget(budgetId);
  }

  Future<List<Budget>> getBudgets() async {
    await Future.delayed(Duration(milliseconds: 15 + _random.nextInt(100)));
    final count = 1 + _random.nextInt(5);
    return List.generate(count, (_) => _generateBudget(_uuid.v4()));
  }
}
