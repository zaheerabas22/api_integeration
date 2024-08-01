import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_integeration/models/products_model.dart';

Future<List<Product>> getProductsApi() async {
  List<Product> productsList = [];

  try {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      
      productsList = data.map((json) => Product.fromJson(json)).toList();

      return productsList;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    return productsList; 
  }
}
