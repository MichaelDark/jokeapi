import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

/// Response model.
@JsonSerializable(createToJson: false)
final class CategoriesResponse {
  /// If the response was erroneous.
  final bool error;

  /// List of categories.
  final List<String> categories;

  /// List of category aliases.
  final List<CategoryAlias> categoryAliases;

  /// Timestamp.
  final int timestamp;

  /// Create response model.
  CategoriesResponse({
    required this.error,
    required this.categories,
    required this.categoryAliases,
    required this.timestamp,
  });

  /// Create response model from JSON.
  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

/// Response model used in [CategoriesResponse].
@JsonSerializable(createToJson: false)
final class CategoryAlias {
  /// Category alias.
  final String alias;

  /// Category name.
  final String resolved;

  /// Create response model.
  CategoryAlias({required this.alias, required this.resolved});

  /// Create response model from JSON.
  factory CategoryAlias.fromJson(Map<String, dynamic> json) =>
      _$CategoryAliasFromJson(json);
}
