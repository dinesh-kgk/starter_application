import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:starter_application/src/models/models.dart';

import '../../core/dio/dio_client.dart';

part 'products.service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class ProductsService {
  factory ProductsService() => _ProductsService(buildDio());

  @GET("/products/")
  Future<ProductsResponse> getProducts();
}

ProductsResponse deserializeProductsResponse(Map<String, dynamic> json) {
  return ProductsResponse.fromJson(json);
}
