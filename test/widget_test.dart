import 'package:alquran/app/data/models/detailsurah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  Future<DetailSurah> getDetailsurah(String id) async {
    Uri url = Uri.parse("https://quran-api-lyart.vercel.app/surah/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];
    DetailSurah test = DetailSurah.fromJson(data);
    print(test);

    return DetailSurah.fromJson(data);
  }
}
