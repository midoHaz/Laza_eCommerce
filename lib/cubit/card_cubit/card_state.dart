part of 'card_cubit.dart';

@immutable
abstract class CardState {}

class CardInitial extends CardState {}

class IncrementItemState extends CardState{}

class DecrementItemState extends CardState{}

class IncrementItem2State extends CardState{}

class DecrementItem2State extends CardState{}