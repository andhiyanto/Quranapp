import 'package:alquran/app/constant/color.dart';
import 'package:alquran/app/data/models/Surah.dart';
import 'package:alquran/app/data/models/detailsurah.dart' as detail;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;
  final String Bismilah = 'assets/image/Frame.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SURAH ${surah.name.transliteration.id.toUpperCase()}'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
            child: GestureDetector(
              onTap: () => Get.defaultDialog(
                  title:
                      "Tafsir ${surah.name.transliteration.id.toUpperCase()} ",
                  // ignore: unnecessary_string_interpolations
                  middleText: "${surah.tafsir.id}"),
              child: Container(
                height: 265,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffDF98FA),
                      Color(
                        0xff9055FF,
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
                      
                  child: Column(
                    children: [
                      Text(
                        "${surah.name.transliteration.id.toUpperCase()} ",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      Text(
                        "${surah.name.translation.id.toUpperCase()} ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "${surah.numberOfVerses} Ayat | ${surah.revelation.id} ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: appWhite),
                      ),
                      SizedBox(height: 24),
                      Container(
                        child: SvgPicture.asset('assets/image/Frame.svg'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getDetailsurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak Ada Data"),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.verses.length ?? 0,
                itemBuilder: (context, index) {
                  detail.Verse? ayat = snapshot.data?.verses[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? appGreyList
                              : appGreyList.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: appPurple,
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(color: appWhite),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${ayat?.text.arab}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${ayat?.text.transliteration.en}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "${ayat?.translation.id}",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
