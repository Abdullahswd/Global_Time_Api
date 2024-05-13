import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class GatAllCountry {
  String name ;
  String flag;
  String link;

  GatAllCountry({ required this.name ,  required this.flag ,required this.link});

  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  getData() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map responses = jsonDecode(response.body);
    //استخراج البيانات على شكل نص وتحويله الى وقت
    DateTime datatime = DateTime.parse(responses["utc_datetime"]);

    //استخراج البيانات على شكل نص وتحويله الى رقم
    int offset = int.parse(responses["utc_offset"].substring(0, 3));

    // حساب وقت البلد من التوقيت العالمي
    DateTime realTime = datatime.add(Duration(hours: offset));

    if (realTime.hour > 6 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    // تحويل الوقت الى التنسيق المطلوب عبر intl
    timeNow = (DateFormat('hh:mm a').format(realTime));
    timeZone = responses['timezone'];
  }
}
