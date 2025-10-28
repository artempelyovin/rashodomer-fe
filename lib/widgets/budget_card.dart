import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rashodomer/widgets/base.dart';
import '../models/budget.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.go('/budgets/${budget.id}');
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (budget.emojiIcon != null)
                    Text(
                      budget.emojiIcon!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  TitleText(text: budget.name),
                  if (kIsWeb) CopyableId(id: budget.id),
                ],
              ),
              SizedBox(height: 5),
              DescriptionText(text: budget.description),
              SizedBox(height: 10),
              PriceText(text: budget.amount.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}

class BudgetDetailCard extends StatefulWidget {
  final Budget budget;

  const BudgetDetailCard({super.key, required this.budget});

  @override
  State<BudgetDetailCard> createState() => _BudgetDetailCardState();
}

class _BudgetDetailCardState extends State<BudgetDetailCard> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;
  final _formKey = GlobalKey<FormState>();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.budget.name);
    _descriptionController = TextEditingController(
      text: widget.budget.description,
    );
    _amountController = TextEditingController(
      text: widget.budget.amount.toString(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _saveBudget() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await Future.delayed(Duration(milliseconds: 1000));
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Бюджет сохранён')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка при сохранении: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.budget.emojiIcon != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.budget.emojiIcon!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Введите название' : null,
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
                maxLines: 2,
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Сумма'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  final value = double.tryParse(v ?? '');
                  if (value == null) return 'Введите число';
                  if (value < 0) return 'Сумма не может быть отрицательной';
                  return null;
                },
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Создан: ${DateFormat('dd MMM yyyy, HH:mm').format(widget.budget.createdAt)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Обновлён: ${DateFormat('dd MMM yyyy, HH:mm').format(widget.budget.updatedAt)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),

                  ElevatedButton.icon(
                    onPressed: _isSaving ? null : _saveBudget,
                    icon: _isSaving
                        ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Icon(Icons.save),
                    label: const Text('Сохранить'),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
