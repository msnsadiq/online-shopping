part of 'bloc_sign_create_bloc.dart';

@immutable
abstract class SignCreateEvent {}
class FetchSignUp extends SignCreateEvent{
  final String userName;
  final String userEmail;
  final String userPassword;
  FetchSignUp(this.userName,this.userEmail,this.userPassword);

}