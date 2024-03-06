import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'baseAPI_services.dart';

class NetworkApiService extends BaseApiServices {
    @override
    Future getGetApiResponse(String url) async {
      dynamic responseJson ;
      try {
        final  response = await http.get
          (Uri.parse(url))
            .timeout(const Duration(seconds: 10));
          responseJson = returnResponse(response);
      }
      on SocketException {
        throw FetchDataException('No Internet Connection');
      }
      return responseJson;
    }
  @override
  Future getPostApiResponse(String url , dynamic data) async{

    dynamic responseJson ;
    try {

      Response response = await post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson ;
  }
  //   @override
  //   Future getPostApiResponse(String url, dynamic data) async {
  //     dynamic responseJson;
  //     try {
  //       Response response;
  //
  //       if (data is FormData) {
  //         response = await post(Uri.parse(url), body: data);
  //       } else {
  //         response = await post(Uri.parse(url), body: jsonEncode(data));
  //       }
  //
  //       responseJson = returnResponse(response);
  //     } on SocketException {
  //       throw FetchDataException('No Internet Connection');
  //     }
  //
  //     return responseJson;
  //   }



    dynamic returnResponse (http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server'+
            'with status code ' +response.statusCode.toString());

    }
  }

}