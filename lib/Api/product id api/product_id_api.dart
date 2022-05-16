import 'dart:convert';

import 'package:http/http.dart';
import 'package:onlineshopping/Model%20Classes/ProductIdModel.dart';
import 'package:onlineshopping/Repository/api_client.dart';

class ApiProductId{
  ApiClient apiClient = ApiClient();
  Future<List<ProductIdModel>>getProductId({required String id})async{
    final String baseIdPath = 'products/$id';
    Response response = await apiClient.invokeAPI(path: baseIdPath, method: 'GET', body: null);
    return ProductIdModel.listFromJson(json.decode(response.body));
  }
}