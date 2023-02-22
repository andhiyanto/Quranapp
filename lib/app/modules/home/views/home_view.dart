import 'package:alquran/app/constant/color.dart';
import 'package:alquran/app/data/models/Surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: const Text(
            'Quran App',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Asslamualaikum',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: appGrey),
              ),
              SizedBox(height: 10),
              Text(
                "Hello, Good " + controller.greeting(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              Container(
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                      width: Get.width,
                      height: 150,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -20,
                            right: -40,
                            child: Container(
                              child: Image.asset("assets/image/logo.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Last Read",
                                      style: TextStyle(
                                          fontSize: 14, color: appWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Surah",
                                  style:
                                      TextStyle(fontSize: 18, color: appWhite),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Ayat",
                                  style:
                                      TextStyle(fontSize: 14, color: appWhite),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              TabBar(
                indicatorColor: appPurple,
                unselectedLabelColor: appGrey,
                labelColor: appPurple,
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "Bookmark",
                  ),
                ],
              ),
              SizedBox(height: 18),
              Expanded(
                child: TabBarView(children: [
                  FutureBuilder<List<Surah>>(
                      future: controller.getAllsurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_SURAH,
                                      arguments: surah);
                                },
                                leading: Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/circular.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${surah.number}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "${surah.name.transliteration.id}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                    "${surah.numberOfVerses} AYAT | ${surah.revelation.id.toUpperCase()}"),
                                trailing: Text(
                                  "${surah.name.short}",
                                  style: TextStyle(
                                      color: appPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            });
                      }),
                  FutureBuilder<List<Surah>>(
                      future: controller.getAllsurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_SURAH,
                                      arguments: surah);
                                },
                                leading: Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/circular.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text("Juz ${index + 1}"),
                              );
                            });
                      }),
                  Text("tab 3"),
                ]),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode ? Get.changeTheme(appLight) : Get.changeTheme(appDark);
        },
        child: Obx(
          () => Icon(
              controller.isDark.isTrue ? Icons.lightbulb : Icons.light_sharp),
        ),
      ),
    );
  }
}
