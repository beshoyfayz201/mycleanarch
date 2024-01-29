import 'dart:convert';

import 'item.dart';

class BookResponse {
  final String? kind;
  final num? totalItems;
  final List<BookModel>? items;

  const BookResponse({this.kind, this.totalItems, this.items});

  factory BookResponse.fromMap(Map<String, dynamic> data) => BookResponse(
        kind: data['kind'] as String?,
        totalItems: data['totalItems'] as num?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => BookModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BookResponse].
  factory BookResponse.fromJson(String data) {
    return BookResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BookResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
