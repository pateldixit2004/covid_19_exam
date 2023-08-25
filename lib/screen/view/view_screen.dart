import 'package:covid_19_api_exam/screen/controller/covide_controller.dart';
import 'package:covid_19_api_exam/screen/model/covide_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  CovidModel? model;
  CovidController controller=Get.put(CovidController());
  
  @override
  void initState() {
    super.initState();
    model=Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${model!.country}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 40,),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("Country=${model!.country}"),

              ),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("deaths=${model!.deaths}"),

              ),
              SizedBox(height: 10,),

              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("deaths=${model!.deaths}"),

              ),

              SizedBox(height: 10,),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("recovered=${model!.recovered}"),

              ),

              SizedBox(height: 10,),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("cases=${model!.cases}"),

              ),

              SizedBox(height: 10,),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("active=${model!.active}"),

              ),

              SizedBox(height: 10,),

              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Text("population=${model!.population}"),

              ),

            ],
          ),
        ),
      ),
    ),);
  }
}
