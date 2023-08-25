import 'dart:convert';

import 'package:covid_19_api_exam/screen/model/covide_model.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  static final Apihelper apihelper = Apihelper._();

  Apihelper._();


  Future<List<CovidModel>> getcovidApi()
  async {
    String? link="https://corona.lmao.ninja/v2/countries";
    var responce=await http.get(Uri.parse(link));
    List json=jsonDecode(responce.body);
    List<CovidModel> covidDataList=json.map((e) => CovidModel.fromJson(e)).toList();
    return covidDataList;
  }
}