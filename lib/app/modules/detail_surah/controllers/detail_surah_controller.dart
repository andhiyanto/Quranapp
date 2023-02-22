import 'package:alquran/app/modules/detail_surah/views/detail_surah_view.dart';
import 'package:get/get.dart';
import 'package:alquran/app/data/models/detailsurah.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailsurah(String id) async {
    Uri url = Uri.parse("https://quran-api-lyart.vercel.app/surah/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    return DetailSurah.fromJson(data);
  }
}
