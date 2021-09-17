// import 'dart:convert';

// class ActivityCalModel3 {
//   final String eventname;
//   final String datetime;
//   ActivityCalModel3({
//     this.eventname,
//     this.datetime,
//   });

//   ActivityCalModel3 copyWith({
//     String eventname,
//     String datetime,
//   }) {
//     return ActivityCalModel3(
//       eventname: eventname ?? this.eventname,
//       datetime: datetime ?? this.datetime,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'Eventname': eventname,
//       'DateTime': datetime,
//     };
//   }

//   factory ActivityCalModel3.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;
  
//     return ActivityCalModel3(
//       eventname: map['Eventname'],
//       datetime: map['DateTime'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ActivityCalModel3.fromJson(String source) => ActivityCalModel3.fromMap(json.decode(source));

//   @override
//   String toString() => 'ActivityCalModel3(Eventname: $eventname, DateTime: $datetime)';

//   @override
//   bool operator ==(Object o) {
//     if (identical(this, o)) return true;
  
//     return o is ActivityCalModel3 &&
//       o.eventname == eventname &&
//       o.datetime == datetime;
//   }

//   @override
//   int get hashCode => eventname.hashCode ^ datetime.hashCode;
// }
