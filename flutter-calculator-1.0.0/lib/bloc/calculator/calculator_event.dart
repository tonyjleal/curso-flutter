part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;

  AddNumber(this.number);
}

class ChangeNegativePositive extends CalculatorEvent {}

class DeleteLastEntry extends CalculatorEvent {}

class OperationEntry extends CalculatorEvent {
  final String operator;

  OperationEntry(this.operator);
}

class CalculateResult extends CalculatorEvent {}
