import 'package:flutter/material.dart';
import 'package:rashodomer/widgets/base.dart';

import '../models/budget.dart';
import '../models/user.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;
  final User? user;

  const BudgetCard({super.key, required this.budget, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Row(
              children: [
                if (budget.emojiIcon != null)
                  Text(
                    budget.emojiIcon!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                TitleText(text: budget.name),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 15),
            child: DescriptionText(text: budget.description),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: PriceText(text: budget.amount.toStringAsFixed(2)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: user == null
                ? CircularProgressIndicator()
                : budget.userId == user!.id
                ? SizedBox.shrink()
                : DescriptionText(
                    text: '${user!.first_name} ${user!.last_name}',
                  ),
          ),
        ],
      ),
    );
  }
}
