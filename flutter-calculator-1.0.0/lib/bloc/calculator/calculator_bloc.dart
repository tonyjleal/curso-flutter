import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<ResetAC>(_resetAC);
    on<AddNumber>(_addNumber);
    on<ChangeNegativePositive>(_changeNegativePositive);
    on<DeleteLastEntry>(_deleteLastEntry);
    on<OperationEntry>(_operationEntry);
    on<CalculateResult>(_calculateResult);
  }

  Future<void> _resetAC(ResetAC event, Emitter<CalculatorState> emit) async {
    return emit(CalculatorState(
      firstNumber: '0',
      secondNumber: '0',
      operation: '',
      mathResult: '0',
    ));
  }

  Future<void> _addNumber(
      AddNumber event, Emitter<CalculatorState> emit) async {
    return emit(state.copyWith(
      mathResult: (state.mathResult == '0')
          ? event.number
          : state.mathResult + event.number,
    ));
  }

  Future<void> _changeNegativePositive(
      ChangeNegativePositive event, Emitter<CalculatorState> emit) async {
    return emit(state.copyWith(
      mathResult: (state.mathResult.contains('-') || state.mathResult == '0')
          ? state.mathResult.replaceFirst('-', '')
          : '-' + state.mathResult,
    ));
  }

  Future<void> _deleteLastEntry(
      DeleteLastEntry event, Emitter<CalculatorState> emit) async {
    bool isNegative = state.mathResult.contains('-');

    return emit(state.copyWith(
        mathResult: (state.mathResult.length == 1 ||
                (state.mathResult.length == 2 && isNegative))
            ? '0'
            : state.mathResult.substring(0, (state.mathResult.length - 1))));
  }

  Future<void> _operationEntry(
      OperationEntry event, Emitter<CalculatorState> emit) async {
    return emit(state.copyWith(
      firstNumber: state.mathResult,
      operation: event.operator,
      secondNumber: '0',
      mathResult: '0',
    ));
  }

  Future<void> _calculateResult(
      CalculateResult event, Emitter<CalculatorState> emit) async {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch (state.operation) {
      case '+':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 + num2}'));
        break;
      case '-':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 - num2}'));
        break;
      case '*':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 * num2}'));
        break;
      case '/':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 / num2}'));
        break;

      default:
        emit(state);
    }
  }
}
