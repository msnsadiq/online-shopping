part of 'bloc_login_bloc.dart';

@immutable
abstract class LoginEvent {}
class FetchLogin extends LoginEvent{
  final String userName;
  final String userEmail;
  final String userPassword;
  FetchLogin({required  this.userName,required this.userEmail,required this.userPassword});
}

