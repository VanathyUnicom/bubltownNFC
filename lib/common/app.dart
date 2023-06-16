
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

//save client-token to hive
  static Future<void> saveClientToken({required String clientToken}) async {
    await HiveService.saveToHive(name: 'clientToken', value: clientToken, boxName: 'account');
  }

//fetch client-token from hive
  static Future<String> fetchClientToken() async {
    return await HiveService.retrieveFromHive(name: 'clientToken', boxName: 'account') ?? '';
  }

  //save token to hive
  static Future<void> saveToken({required String token}) async {
    await HiveService.saveToHive(name: 'token', value: token, boxName: 'account');
  }

//fetch token from hive
  static Future<String> fetchToken() async {
    return await HiveService.retrieveFromHive(name: 'token', boxName: 'account') ?? '';
  }

  static Future<void> removeToken() async {
    await HiveService.removeFromHive(name: 'token', boxName: 'account');
  }

  //save profile to hive
  static Future<void> saveProfile({required String profile}) async {
    await HiveService.saveToHive(name: 'profile', value: profile, boxName: 'account');
  }

  //fetch profile to hive
  static Future<String> fetchProfile() async {
    return await HiveService.retrieveFromHive(name: 'profile', boxName: 'account') ?? '';
  }

  //remove profile to hive
  static Future<void> removeProfile() async {
    await HiveService.removeFromHive(name: 'profile', boxName: 'account');
  }

  //remove theme to hive
  static Future<void> saveTheme({required String themeMode}) async {
    await HiveService.saveToHive(name: 'themeMode', value: themeMode, boxName: 'theme');
  }

  //fetch theme from hive
  static Future<String> fetchTheme() async {
    return await HiveService.retrieveFromHive(name: 'themeMode', boxName: 'theme') ?? '';
  }

  //save package details to hive
  static Future<void> savePackage({required Map selectedPackage}) async {
    await HiveService.saveToHive(name: 'package', value: selectedPackage, boxName: 'account');
  }

  static Future<Map> fetchPackage() async {
    return await HiveService.retrieveFromHive(name: 'package', boxName: 'account') ?? '';
  }

  static Future<bool> checkAuth() async {
    String _token = '';
    try {
      _token = await App.fetchToken();
      if (_token != '') {
        getIt<UserProvider>().setIsAuthorized = true;
      } else {
        getIt<UserProvider>().setIsAuthorized = false;
      }
    } catch (e) {
      getIt<UserProvider>().setIsAuthorized = false;
    }

    return getIt<UserProvider>().isAuthorized;
  }

  static dateFormet(String date) {
    try {
      DateTime dateTime = DateTime.parse(date);
      int month = dateTime.month;
      List<String> months = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Augt", "Sep", "Oct", "Nov", "Dec"];

      int hr = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
      String hour = (hr <= 9) ? ("0" + hr.toString()) : hr.toString();
      String minute = (dateTime.minute <= 9) ? ("0" + dateTime.minute.toString()) : dateTime.minute.toString();
      String amPm = (dateTime.hour < 12) ? "AM " : "PM ";
      return hour +
          ":" +
          minute +
          " " +
          amPm +
          "" +
          dateTime.day.toString() +
          " " +
          months[month] +
          " " +
          dateTime.year.toString();
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
      day = "0" + date.day.toString();
    } else {
      day = date.day.toString();
    }
    if (date.month < 10) {
      month = "0" + date.month.toString();
    } else {
      month = date.month.toString();
    }

    return day + "/" + month + "/" + date.year.toString();
  }
}