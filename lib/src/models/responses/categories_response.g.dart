// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      error: json['error'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categoryAliases: (json['categoryAliases'] as List<dynamic>)
          .map((e) => CategoryAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: (json['timestamp'] as num).toInt(),
    );

CategoryAlias _$CategoryAliasFromJson(Map<String, dynamic> json) =>
    CategoryAlias(
      alias: json['alias'] as String,
      resolved: json['resolved'] as String,
    );
