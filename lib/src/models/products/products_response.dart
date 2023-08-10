// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "products")
  final List<Product> products;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "skip")
  final int skip;
  @JsonKey(name: "limit")
  final int limit;

  ProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "discountPercentage")
  final double discountPercentage;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "stock")
  final int stock;
  @JsonKey(name: "brand")
  final String brand;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "thumbnail")
  final String thumbnail;
  @JsonKey(name: "images")
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() => toJson().toString();
}
