import 'package:flutter/cupertino.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
//String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class EventModel{
//   Event? event;
//     bool? isError;
//    Error? error;

// EventModel({
//    this.event,
//    this.isError,
//    this.error,
// });

// factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
//         event: Event.fromJson(json["result"]),
//         isError: json["isError"],
//         error: Error.fromJson(json["error"]),
//     );

// Map<String, dynamic> toJson() => {
//         "result": event?.toJson(),
//         "isError": isError,
//         "error": error?.toJson(),
//     };
// }

// class Error {
//     Error();

//     factory Error.fromJson(Map<String, dynamic> json) => Error(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }

class Event {
  int? views;
  int? shares;
  int? price;
  String? id;
  String? name;
  String? desc;
  List<String>? images;
  int? ratingAverage;
  int? ratingCount;
  bool? isActive;
  String? eventLocation;
  String? eventWebsite;
  String? eventContactNumber;
  double? lat;
  double? lon;
  List<EventTimeSlot>? eventTimeSlots;

  Event({
    this.views,
    this.shares,
    this.price,
    this.id,
    this.name,
    this.desc,
    this.images,
    this.ratingAverage,
    this.ratingCount,
    this.isActive,
    this.eventLocation,
    this.eventWebsite,
    this.eventContactNumber,
    this.lat,
    this.lon,
    this.eventTimeSlots,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        views: json["views"] ?? 0,
        shares: json["shares"] ?? 0,
        price: json["price"] ?? 0.0,
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        desc: json["desc"] ?? '',
        images: json["images"] != null
          ? List<String>.from(json["images"].map((x) => x))
          : [],
        ratingAverage: json["ratingAverage"],
        ratingCount: json["ratingCount"],
        isActive: json["isActive"],
        eventLocation: json["eventLocation"] ?? '',
        eventWebsite: json["eventWebsite"] ?? '',
        eventContactNumber: json["eventContactNumber"] ?? '',
        lat: json["lat"]?.toDouble() ?? 0.0,
        lon: json["lon"]?.toDouble() ?? 0.0,
        eventTimeSlots: List<EventTimeSlot>.from(json["eventTimeSlots"].map((x) => EventTimeSlot.fromJson(x))) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "views": views,
        "shares": shares,
        "price": price,
        "id": id,
        "name": name,
        "desc": desc,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "ratingAverage": ratingAverage,
        "ratingCount": ratingCount,
        "isActive": isActive,
        "eventLocation": eventLocation,
        "eventWebsite": eventWebsite,
        "eventContactNumber": eventContactNumber,
        "lat": lat,
        "lon": lon,
        "eventTimeSlots": List<dynamic>.from(eventTimeSlots!.map((x) => x.toJson())),
      };
}

class EventTimeSlot {
  String? id;
  bool? isSingleDayEvent;
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  DateTime? startDateTime;
  DateTime? endDateTime;
  String? timezone;
  List<int>? applicableWeekDays;

  EventTimeSlot({
    this.id,
    this.isSingleDayEvent,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.startDateTime,
    this.endDateTime,
    this.timezone,
    this.applicableWeekDays,
  });

  factory EventTimeSlot.fromJson(Map<String, dynamic> json) => EventTimeSlot(
        id: json["id"] ?? '',
        isSingleDayEvent: json["isSingleDayEvent"] ,
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        startDateTime: DateTime.parse(json["startDateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        timezone: json["timezone"],
        applicableWeekDays: List<int>.from(json["applicableWeekDays"].map((x) => x)) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isSingleDayEvent": isSingleDayEvent,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
        "startDateTime": startDateTime?.toIso8601String(),
        "endDateTime": endDateTime?.toIso8601String(),
        "timezone": timezone,
        "applicableWeekDays": List<dynamic>.from(applicableWeekDays!.map((x) => x)),
      };
}
