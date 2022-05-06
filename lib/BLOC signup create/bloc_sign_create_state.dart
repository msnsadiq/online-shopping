part of 'bloc_sign_create_bloc.dart';

@immutable
abstract class SignCreateState {}

class SignCreateInitial extends SignCreateState {}
class SignCreateLoaded extends SignCreateState{}
class SignCreateLoading extends SignCreateState{}
class SignCreateError  extends SignCreateState{}