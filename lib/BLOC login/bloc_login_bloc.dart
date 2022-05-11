import 'dart:async';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:onlineshopping/Api/login%20api/login_api.dart';
import 'package:onlineshopping/Repository/api_client.dart';
import 'package:onlineshopping/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
 // ApiClient apiClient = ApiClient();
  LoginApii loginApii;
  late String loginValue ;
  LoginBloc(this.loginApii) : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async{
      emit(LoginLoading());
      try{
       loginValue  = await loginApii.getLogin(userName: event.userName, userEmail: event.userEmail, userPassword: event.userPassword);
       print("\"Login successful!\"");
   if(loginValue == "\"Login successful!\"") {
     print(loginValue);
     emit(LoginLoaded());
     final prefrence = await SharedPreferences.getInstance();
     prefrence.setBool(KEY_NAME, true);
   }else if(loginValue == "\"Unauthorized\"") {
     print("login fail");
     emit(LoginCheck());
   }
      }
      catch(e){
        print("========================$e");
        emit(LoginError());
      }
      // TODO: implement event handler
    });
  }
}
