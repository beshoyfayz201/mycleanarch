import 'dart:convert';


import 'item.dart';

class Books {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  const Books({this.kind, this.totalItems, this.items});

  factory Books.fromMap(Map<String, dynamic> data) => Books(
        kind: data['kind'] as String?,
        totalItems: data['totalItems'] as int?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Books].
  factory Books.fromJson(String data) {
    return Books.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Books] to a JSON string.
  String toJson() => json.encode(toMap());
}
