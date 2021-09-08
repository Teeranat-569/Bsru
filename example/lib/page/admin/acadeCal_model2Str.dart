import 'dart:convert';

class AcadeModel {
  final String link2;
  AcadeModel({
    this.link2,
  });

  AcadeModel copyWith({
    String link2,
  }) {
    return AcadeModel(
      link2: link2 ?? this.link2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link2': link2,
    };
  }

  factory AcadeModel.fromMap(Map<String, dynamic> map) {
    return AcadeModel(
      link2: map['link2'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AcadeModel.fromJson(String source) =>
      AcadeModel.fromMap(json.decode(source));

  @override
  String toString() => 'AcadeModel(link2: $link2)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcadeModel && other.link2 == link2;
  }

  @override
  int get hashCode => link2.hashCode;
}
