import 'package:chopper/chopper.dart';
import 'package:starter_application/src/core/chopper/chopper_client.dart';
import 'package:starter_application/src/core/chopper/json_serializable_converter.dart';
import 'package:starter_application/src/models/models.dart';

part 'products.service.chopper.dart';

@ChopperApi()
abstract class ProductsService extends ChopperService {
  static ProductsService create() {
    final client = CustomClient(
      const JsonSerializableConverter({
        ProductsResponse: ProductsResponse.fromJson,
        Product: Product.fromJson,
      }),
    );
    return _$ProductsService(client);
  }

  @Get(path: "http/403/forbidden")
  Future<Response<ProductsResponse>> getProducts();
}
