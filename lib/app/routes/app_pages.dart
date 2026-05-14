import 'package:get/get.dart';

import '../modules/expense/bindings/expense_binding.dart';
import '../modules/expense/views/expense_view.dart';
import '../modules/income/bindings/income_binding.dart';
import '../modules/income/views/income_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/goal/bindings/goal_binding.dart';
import '../modules/goal/views/goal_view.dart';
import '../modules/budget/bindings/budget_binding.dart';
import '../modules/budget/views/budget_view.dart';
import '../modules/recurring/bindings/recurring_binding.dart';
import '../modules/recurring/views/recurring_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INCOME,
      page: () => const IncomeView(),
      binding: IncomeBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: _Paths.GOAL,
      page: () => const GoalView(),
      binding: GoalBinding(),
    ),
    GetPage(
      name: _Paths.BUDGET,
      page: () => const BudgetView(),
      binding: BudgetBinding(),
    ),
    GetPage(
      name: _Paths.RECURRING,
      page: () => const RecurringView(),
      binding: RecurringBinding(),
    ),
  ];
}
