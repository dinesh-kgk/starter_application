import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:starter_application/src/models/models.dart';

import '../../core/dio/dio_client.dart';

part 'products.service.g.dart';

@RestApi()
abstract class ProductsService {
  factory ProductsService() => _ProductsService(buildDio());

  @GET("/http/401/hi")
  Future<ProductsResponse> getProducts();
}
