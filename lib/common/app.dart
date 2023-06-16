
import '../models/dio_models.dart';


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
      return "12:30 AM";
    } catch (error) {
      return "12:30 AM";
    }
  }

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