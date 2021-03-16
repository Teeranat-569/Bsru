import 'dart:convert';

class LinkModel {
 final String link;
  LinkModel({
    this.link,
  });

  LinkModel copyWith({
    String link,
  }) {
    return LinkModel(
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
    };
  }

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return LinkModel(
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkModel.fromJson(String source) => LinkModel.fromMap(json.decode(source));

  @override
  String toString() => 'LinkModel(link: $link)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is LinkModel &&
      o.link == link;
  }

  @override
  int get hashCode => link.hashCode;
}
