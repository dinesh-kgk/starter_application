import 'package:chopper/chopper.dart';

const baseUrl = "https://dummyjson.com/";

final class CustomClient extends ChopperClient {
  CustomClient(Converter converter)
      : super(
          baseUrl: Uri.parse(baseUrl),
          interceptors: [
            HttpLoggingInterceptor(),
          ],
          converter: converter,
        );
}
