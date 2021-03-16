import 'dart:convert';

class PicModel {
  String pic;
  PicModel({
    this.pic,
  });

  PicModel copyWith({
    String pic,
  }) {
    return PicModel(
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pic': pic,
    };
  }

  factory PicModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PicModel(
      pic: map['pic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PicModel.fromJson(String source) => PicModel.fromMap(json.decode(source));

  @override
  String toString() => 'PicModel(pic: $pic)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PicModel &&
      o.pic == pic;
  }

  @override
  int get hashCode => pic.hashCode;
}
