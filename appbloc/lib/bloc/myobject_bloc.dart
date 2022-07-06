import 'package:appbloc/bloc/myobject_event.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'myobject_state.dart';

class MyobjectBloc extends Bloc<MyobjectEvent, MyobjectState> {
  MyobjectBloc() : super(const MyobjectState(counter: 99)) {
    on<AddEvent>(_onIncrement);
    on<SubtractEvent>(_onDecrement);
  }

  void _onIncrement(AddEvent event, Emitter<MyobjectState> emit) =>
      emit(MyobjectState(counter: state.counter + 1));
  void _onDecrement(SubtractEvent event, Emitter<MyobjectState> emit) =>
      emit(MyobjectState(counter: state.counter - 1));
}
