import 'package:bubltown_nfc/models/dio_models.dart';
import 'package:bubltown_nfc/models/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/vendor_model.dart';
import '../../../services/event_service.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
//String welcomeToJson(Welcome data) => json.encode(data.toJson());

class EventViewModel extends BaseViewModel {
  ErrorModel? errorModel;
  bool isLoading=true;
  Event? event;
  Vendor? vendor;
  
  String venderId='cc455427-be7f-4364-ebb3-08dae311394a';

  void onInit() {
    getEventDetails();
    
  }

  getEventDetails({String id = ""}) async {
    await EventService.getEvent().then((value) {
      if (value is Event) {
        event = value;
        isLoading = false;
        notifyListeners();
        getVandorDetails();
      } else {
        errorModel = value;
        isLoading = false;
        notifyListeners();
      }
    });
  }

  getVandorDetails({String id = ""}) async {
    await EventService.getVendor(venderId).then((value) {
      if (value is Vendor) {
        vendor = value;
        isLoading = false;
        notifyListeners();
      } else {
        errorModel = value;
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void viewEvent(BuildContext context){
    launchUrl(Uri.parse("https://bubltown.page.link/Nd3n"));
  }

}
