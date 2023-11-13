import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 4)
class IncomeCategory extends HiveObject {
  @HiveField(0)
  String incomeCategory;

  IncomeCategory({
    required this.incomeCategory,
  });
}

@HiveType(typeId: 5)
class ExpenseCategory extends HiveObject {
  @HiveField(0)
  String expenseCategory;

  ExpenseCategory({
    required this.expenseCategory,
  });
}
