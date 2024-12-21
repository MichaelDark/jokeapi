// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable(createToJson: false)
final class CategoriesResponse {
  final bool error;
  final List<String> categories;
  final List<CategoryAlias> categoryAliases;
  final int timestamp;

  CategoriesResponse({
    required this.error,
    required this.categories,
    required this.categoryAliases,
    required this.timestamp,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
final class CategoryAlias {
  final String alias;
  final String resolved;

  CategoryAlias({required this.alias, required this.resolved});

  factory CategoryAlias.fromJson(Map<String, dynamic> json) =>
      _$CategoryAliasFromJson(json);
}
