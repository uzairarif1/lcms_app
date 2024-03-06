import 'Cases.dart';

class CasesModel {
  CasesModel({
      this.pageName, 
      this.cases,});

  CasesModel.fromJson(dynamic json) {
    pageName = json['page_name'];
    if (json['cases'] != null) {
      cases = [];
      json['cases'].forEach((v) {
        cases!.add(Cases.fromJson(v));
      });
    }
  }
  String ?pageName;
  List<Cases> ?cases;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_name'] = pageName;
    if (cases != null) {
      map['cases'] = cases!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}