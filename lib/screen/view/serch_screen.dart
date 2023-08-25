import 'package:covid_19_api_exam/screen/controller/covide_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/covide_model.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({super.key});

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  CovidController controller=Get.put(CovidController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.serchData(value);
              },
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)
                ),hintText: 'Search...',
              ),
            ),
             Expanded(
                child: Obx(() => ListView.builder(itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        CovidModel model = CovidModel(
                          country: controller.list[index].country,
                          deaths: controller.list[index].deaths,
                          cases: controller.list[index].cases,
                          active: controller.list[index].active,
                          population: controller.list[index].population,
                          recovered: controller.list[index].recovered,
                        );
                        Get.toNamed("/dataview", arguments: model);
                      },
                      child: ListTile(
                        title: Text("${controller.list[index].country}"),
                      ),
                    );
                  },itemCount: controller.list.length,),
                ),
              ),

          ],
        ),
      ),
    ),);
  }
}
