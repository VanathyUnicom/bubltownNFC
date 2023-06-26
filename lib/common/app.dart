
import 'package:flutter/cupertino.dart';

import '../models/dio_models.dart';
import 'globel_variables.dart';


class App {
  //common api body
  static CommonRestBody responseMessage(
    response,
  ) {
    try {
      CommonRestBody body = CommonRestBody.fromJson(response.data);
      return body;
    } catch (e) {
      CommonRestBody body = CommonRestBody();
      return body;
    }
  }
 


  static dateFormet(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      int month = dateTime.month;
      List<String> months = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Augt", "Sep", "Oct", "Nov", "Dec"];

      int hr = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
      String hour = (hr <= 9) ? ("0$hr") : hr.toString();
      String minute = (dateTime.minute <= 9) ? ("0${dateTime.minute}") : dateTime.minute.toString();
      String amPm = (dateTime.hour < 12) ? "AM " : "PM ";
      return "$hour:$minute $amPm${dateTime.day} ${months[month]} ${dateTime.year}";
      // ignore: unused_catch_clause
    } on Exception catch (exception) {
      return "Error";
    } catch (error) {
      return "error";
    }
  }
// static String checkHasZ(String? date) {
//     String val = "";
//     if (date != null && date != "") {
//       if (date.toLowerCase().endsWith('z')) {
//         val = date;
//       } else {
//         val = "${date}Z";
//       }
//     }
//     return val;
//   }
  //  static String nextLine({required String string}) {
  //   String finalText = "";
  //   if (string.contains("#")) {
  //     var splitedString = string.split("#");
  //     finalText = "${splitedString[0]}\n${splitedString[1]}";
  //     debugPrint(finalText);
  //     return finalText;
  //   } else {
  //     return string;
  //   }
  // }
  //   static String timeWithAMPM(String dateTime, {bool needToLocal = false, bool addZ = false}) {
  //   try {
  //     if (addZ) {
  //       dateTime = checkHasZ(dateTime);
  //     }
  //     DateTime date;
  //     if (needToLocal) {
  //       date = DateTime.parse(dateTime).toLocal();
  //     } else {
  //       date = DateTime.parse(dateTime);
  //     }
  //     int hr = date.hour > 12 ? date.hour - 12 : date.hour;
  //     String hour = (hr <= 9) ? (hr.toString()) : hr.toString();
  //     String minute = (date.minute <= 9) ? ("0${date.minute}") : date.minute.toString();
  //     String amPm = (date.hour < 12) ? GlobalVariable.customerLocale.am : GlobalVariable.customerLocale.pm;
  //     return "$hour:$minute $amPm";
  //   } catch (error) {
  //     return "12:30 AM";
  //   }
  // }

  static String dobFormat({required DateTime date}) {
    String day = "";
    String month = "";
    if (date.day < 10) {
      day = "0${date.day}";
    } else {
      day = date.day.toString();
    }
    if (date.month < 10) {
      month = "0${date.month}";
    } else {
      month = date.month.toString();
    }

    return "$day/$month/${date.year}";
  }

 
}

