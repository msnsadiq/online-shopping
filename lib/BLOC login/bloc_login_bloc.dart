import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlineshopping/Api/login%20api/login_api.dart';
import 'package:onlineshopping/Repository/api_client.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginApii loginApii;
  late String loginValue ;
  LoginBloc(this.loginApii) : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async{
      emit(LoginLoading());
      try{
       loginValue  = await loginApii.getLogin(userName: event.userName, userEmail: event.userEmail, userPassword: event.userPassword);
       emit(LoginLoaded());
      }
      catch(e){
        emit(LoginError());
      }
      // TODO: implement event handler
    });
  }
}
