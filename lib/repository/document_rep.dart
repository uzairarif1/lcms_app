
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
import '../model/Auth_model.dart';
import '../model/PostDocumentModel.dart';
import '../res/app_urls.dart';
import '../view_model/user_viewmodel.dart';

class UploadDocRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<DocumentModel> uploadImageAndDocument(UserViewModel userViewModel, dynamic document) async {
    try {
      final AuthModel userModel = await userViewModel.getUser();
      final String userId = userModel.userId.toString();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppURL.pDocURL}$userId'),
      );

      if (document != null) {
        request.files.add(await http.MultipartFile.fromPath('doc', document));
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseBody);

      return DocumentModel.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

}