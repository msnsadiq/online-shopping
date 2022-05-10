import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlineshopping/Api/signup%20create%20api/api_signup_create.dart';
import 'package:onlineshopping/Model%20Classes/SignUpCreateModelClass.dart';

part 'bloc_sign_create_event.dart';
part 'bloc_sign_create_state.dart';

class SignCreateBloc extends Bloc<SignCreateEvent, SignCreateState> {
  SignUpApi signUpApi;
  late SignUpCreateModelClass signUpCreateModelClass;
  SignCreateBloc(this.signUpApi) : super(SignCreateInitial()) {
    on<FetchSignUp>((event, emit)async {
      emit(SignCreateLoading());
      try{
        print("*************");
        signUpCreateModelClass = await signUpApi.getSignupCreate(event.userEmail, event.userPassword, event.userName);

        emit(SignCreateLoaded());
      }
      catch(e){
        print("*************$e");
        emit(SignCreateError());
      }
      // TODO: implement event handler
    });
  }
}
