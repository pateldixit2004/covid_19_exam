import 'package:covid_19_api_exam/screen/model/covide_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/covide_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CovidController controller = Get.put(CovidController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Covid-19"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/serch");
              },
              icon: Icon(Icons.search_rounded),
            ),
          ],
        ),
        body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List<CovidModel>? list = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        CovidModel model = CovidModel(
                            country: list[index].country,
                            deaths: list[index].deaths,
                          cases: list[index].cases,
                          active: list[index].active,
                          population: list[index].population,
                          recovered: list[index].recovered,
                        );
                        Get.toNamed("/dataview", arguments: model);
                      },
                      child: ListTile(
                        leading: list[index].countryInfo!.flag!.isEmpty
                            ? Image.network(
                                "https://m.media-amazon.com/images/I/61y2VVWcGBL._AC_UL600_FMwebp_QL65_.jpg")
                            : Image.network("${list[index].countryInfo!.flag}",height: 50,width: 50,),
                        title: Text("${list[index].country}"),
                      ),
                    );
                  },
                  itemCount: list!.length,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
            future: controller.takeCovidApi()),
      ),
    );
  }
}
