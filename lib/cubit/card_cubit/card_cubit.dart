import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());
  int count=1;
  int count2=1;
  void incrementItem(){
    count++;
    emit(IncrementItemState());
  }

  void decrementItem(){
    if(count>0){
      count--;
      emit(DecrementItemState());
    }
  }

  void incrementItem2(){
    count2++;
    emit(IncrementItem2State());
  }

  void decrementItem2(){
    if(count2>0){
      count2--;
      emit(DecrementItem2State());
    }
  }
}
