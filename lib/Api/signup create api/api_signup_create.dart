import 'dart:convert';

import 'package:http/http.dart';
import 'package:onlineshopping/Model%20Classes/SignUpCreateModelClass.dart';
import 'package:onlineshopping/Repository/api_client.dart';

class SignUpApi{
  ApiClient apiClient = ApiClient();

  Future<SignUpCreateModelClass>getSignupCreate(String userEmail, String userPassword, String userName)async{
    String basePath = 'signup?email=$userEmail&password=$userPassword&name=$userName';
    Response response = await apiClient.invokeAPI(path: basePath, method: 'POST', body: null);
    return SignUpCreateModelClass.fromJson(json.decode(response.body));
  }
}