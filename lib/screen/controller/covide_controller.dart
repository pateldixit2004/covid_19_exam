import 'package:covid_19_api_exam/utiles/api_helper.dart';
import 'package:covid_19_api_exam/utiles/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/covide_model.dart';


class CovidController extends GetxController
{
  List<CovidModel> covidList=[];

  
  Future<List<CovidModel>> takeCovidApi()
  async {
    covidList=await Apihelper.apihelper.getcovidApi();
    return covidList;
  }


  RxList<CovidModel> list=<CovidModel>[].obs;
  List<CovidModel> fiterlist=[];

  void serchData(String serch)
  {
    if(serch.isEmpty)
    {
      list.value=List.from(covidList);
      print("==============================${list.length}");
    }
    else
    {
      fiterlist.clear();

      for(var c in covidList)
      {
        if(c.country!.toLowerCase().contains(serch!.toLowerCase()) )
        {
          fiterlist.add(c);
        }
      }
      list.value=List.from(fiterlist);
    }
  }


  RxList dataList=[].obs;
  Future<void> getData()
  async {
    dataList.value =await DatabaseHelper.helper.readDb();
  }
}