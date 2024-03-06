import 'Client.dart';

class ClientProfileDataModel {
  ClientProfileDataModel({
      this.pageName, 
      this.client,});

  ClientProfileDataModel.fromJson(dynamic json) {
    pageName = json['page_name'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }
  String ?pageName;
  Client ?client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_name'] = pageName;
    if (client != null) {
      map['client'] = client!.toJson();
    }
    return map;
  }

}