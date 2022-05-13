import 'dart:convert';

import 'package:http/http.dart';
import 'package:onlineshopping/Model%20Classes/ProductReadModel.dart';
import 'package:onlineshopping/Repository/api_client.dart';

class ProductRead{
  ApiClient apiClient = ApiClient();
  final String productPath = 'products';
Future <List<ProductReadModel>>getProduct()async{
  Response response = await apiClient.invokeAPI(path: productPath, method: 'GET', body: null);
  return ProductReadModel.listFromJson(json.decode(response.body));
}
}