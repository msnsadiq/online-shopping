import 'package:http/http.dart';
import 'package:onlineshopping/Repository/api_client.dart';

class LoginApii{
  ApiClient apiClient = ApiClient();
  final String loginpath = 'login';
  Future<String>getLogin({ required  String userName,required  String userEmail,required String userPassword })async{
    final  body = "{\"name\": \"$userName\", \"email\": \"$userEmail\",\"password\": \"$userPassword\"}";
    Response response = await apiClient.invokeAPI(path: loginpath, method: 'POST', body: body);
    return response.body;
  }
}