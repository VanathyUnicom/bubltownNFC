import 'package:bubltown_nfc/models/vendor_model.dart';

import '../common/app.dart';
import '../models/dio_models.dart';
import '../models/event_model.dart';
import 'dio_service.dart';

class EventService {

  static Future<dynamic> getEvent() async {
    var res = await DioService().get('catalog/v2.0/Product/d65fd984-38b7-43f4-b5bc-65b94210c605/catalog/1c803516-1b09-4c54-b0d2-8a3af6c832c0', token: true);
    CommonRestBody body = App.responseMessage(res);
    if (!body.isError) {
      return Event.fromJson(body.result);
    } else {
      return body.error;
    }
  }

  static Future<dynamic> getVendor(String id) async {
    var res = await DioService().get("industry/v2.0/vendor/$id?[include]=VendorAddress,ServiceOptions,Industry", token: true);
    CommonRestBody body = App.responseMessage(res);
    if (!body.isError) {
      return Vendor.fromJson(body.result);
    } else {
      return body.error;
    }
  }
}
