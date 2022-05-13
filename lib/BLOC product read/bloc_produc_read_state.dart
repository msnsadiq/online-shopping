part of 'bloc_produc_read_bloc.dart';

@immutable
abstract class ProducReadState {}

class ProducReadInitial extends ProducReadState {}
class ProducReadLoading extends ProducReadState{}
class ProducReadLoaded extends ProducReadState{}
class ProducReadError extends ProducReadState{}
