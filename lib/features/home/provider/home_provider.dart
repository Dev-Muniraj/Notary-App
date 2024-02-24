import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notary_app/constants/connection.dart';
import 'package:notary_app/utils/print_app.dart';

import '../response/notary_response.dart';

class HomePageProvider extends ChangeNotifier {

  bool _error = false;
  NotaryResponse? notaryResponse;
  String _errorMessage = '';

  bool get error => _error;
  NotaryResponse? get notaryResponseModel => notaryResponse;
  String get errorMessage => _errorMessage;
  bool get ifLoading => notaryResponse == null && error == false;

  List<Leads> leadData = [];
  Future<void> sampleApi() async {
    if (!await Connection.isConnected()) {
      return;
    }

    String uri =
        "https://api.thenotary.app/lead/getLeads";
    Dio dio = Dio();
    Response response = await dio.post(
      uri,
      data: {"notaryId": "643074200605c500112e0902"},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    appPrint(message:response.data.toString());
    appPrint(message:'response data fetched ');
    if (response.statusCode == 200) {
      try {
        if (response.statusCode == HttpStatus.ok) {
          notaryResponse = NotaryResponse.fromJson(response.data);
          if (notaryResponse != null) { 
            leadData = notaryResponse!.leads;
          }
        }
      } on DioException catch (e) {
        _error = true;
        _errorMessage = e.toString();
        notaryResponse = null;
        appPrint(message:"Sample init Api  is Fail $e");
      }
    } else {
      _errorMessage = response.statusCode.toString();
      notaryResponse = null;
      _error = true;
      appPrint(message:'Error');
    }
    notifyListeners();
  }

}
