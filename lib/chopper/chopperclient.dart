import 'package:chopper/chopper.dart';

const baseUrl = "https://jsonplaceholder.typicode.com";

class ChopperSingleton {
  static ChopperClient? _client;

  static ChopperClient getClient() {
    _client ??= ChopperClient(
      baseUrl: Uri.parse("https://dummyjson.com/"),
      interceptors: [HttpLoggingInterceptor()],
      converter: JsonConverter(),
    );
    return _client!;
  }
}
