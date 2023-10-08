import 'package:flutter_modules/modules/push_notification/data/pn_api_service.dart';

class PNRepository {
  final PNApiService api;

  PNRepository(this.api);

  void sendMessage(
      {required String title, required String body, required String token}) {
    api.postData(
      endPoint: PNEndPoints.send,
      data: {
        "to":
            "cEsXisyDSaSQ9rLT0CSXWw:APA91bGjnF9MPFUV-K0coiL8ZjlvaeDu1zByZ9m0FjNI2_X81CgE_oeMe7u2SOxld9g_34VtPLjujYw5IUd9NYJ4DZoLi5wsLcTMK0vXXu_fWbAQYNNVDWpmklFJmgeo3zSDX-8IfZ70",
        // "priority": "high",
        "notification": {
          "title": title,
          "body": body,
          // "android_channel_id": "high_important_channel",
          // "sound": "default",
        },
        'data': {"title": title, "body": body, "description": "I did it"}
      },
    );
  }
}
