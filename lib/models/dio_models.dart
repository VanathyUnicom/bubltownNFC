// ignore_for_file: unnecessary_new


class CommonRestBody {
  CommonRestBody({
    this.result,
    this.isError = false,
    this.error = const ErrorModel(),
  });

  dynamic result;
  bool isError;
  ErrorModel error;

  factory CommonRestBody.fromJson(Map<String, dynamic> json) => CommonRestBody(
        result: json["result"],
        isError: json["isError"] ?? true,
        error: ErrorModel.fromJson(json["error"], json["isError"]),
      );
}

class ErrorModel {
  final String title;
  final String detail;
  final String status;
  final bool isError;

  const ErrorModel({this.title = '', this.detail = '', this.status = '200', this.isError = false});

  factory ErrorModel.fromJson(Map<String, dynamic> json, bool isError) => ErrorModel(
        title: json["title"] ?? "",
        detail: json["detail"] ?? "",
        status: json["status"] ?? "",
        isError: isError,
      );
}

class Deserialize {
  static CommonRestBody responseMessage(response) {
    try {
      CommonRestBody body = CommonRestBody.fromJson(response.data);
      return body;
    } catch (e) {
      CommonRestBody body = new CommonRestBody(
          result: {}, isError: true, error: new ErrorModel(title: e.toString(), detail: e.toString(), status: "", isError: true));
      return body;
    }
  }
}
