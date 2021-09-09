import 'dart:convert';

class LinkModel {
  final String link;
  final String nameManual;
  LinkModel({
     this.link,
    this.nameManual,
  });

  LinkModel copyWith({
    String link,
    String nameManual,
  }) {
    return LinkModel(
      link: link ?? this.link,
      nameManual: nameManual ?? this.nameManual,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'nameManual': nameManual,
    };
  }

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      link: map['link'],
      nameManual: map['nameManual'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkModel.fromJson(String source) => LinkModel.fromMap(json.decode(source));

  @override
  String toString() => 'LinkModel(link: $link, nameManual: $nameManual)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LinkModel &&
      other.link == link &&
      other.nameManual == nameManual;
  }

  @override
  int get hashCode => link.hashCode ^ nameManual.hashCode;
}
