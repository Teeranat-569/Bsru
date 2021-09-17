// import 'dart:convert';

// class AcadeCalModel2 {
//   final String eventname;
//   final String datetimeStart;
//   final String datetimeEnd;
//   AcadeCalModel2({
//     this.eventname,
//     this.datetimeStart,
//     this.datetimeEnd,
//   });


//   AcadeCalModel2 copyWith({
//     String eventname,
//     String datetimeStart,
//     String datetimeEnd,
//   }) {
//     return AcadeCalModel2(
//       eventname: eventname ?? this.eventname,
//       datetimeStart: datetimeStart ?? this.datetimeStart,
//       datetimeEnd: datetimeEnd ?? this.datetimeEnd,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'Eventname': eventname,
//       'DateTimeStart': datetimeStart,
//       'DateTimeEnd': datetimeEnd,
//     };
//   }

//   factory AcadeCalModel2.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;
  
//     return AcadeCalModel2(
//       eventname: map['Eventname'],
//       datetimeStart: map['DateTimeStart'],
//       datetimeEnd: map['DateTimeEnd'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AcadeCalModel2.fromJson(String source) => AcadeCalModel2.fromMap(json.decode(source));

//   @override
//   String toString() => 'AcadeCalModel2(Eventname: $eventname, DateTimeStart: $datetimeStart, DateTimeEnd: $datetimeEnd)';

//   @override
//   bool operator ==(Object o) {
//     if (identical(this, o)) return true;
  
//     return o is AcadeCalModel2 &&
//       o.eventname == eventname &&
//       o.datetimeStart == datetimeStart &&
//       o.datetimeEnd == datetimeEnd;
//   }

//   @override
//   int get hashCode => eventname.hashCode ^ datetimeStart.hashCode ^ datetimeEnd.hashCode;
// }
