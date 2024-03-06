import 'Hearings.dart';

class HearingsModel {
  HearingsModel({
      this.pageName, 
      this.hearings,});

  HearingsModel.fromJson(dynamic json) {
    pageName = json['page_name'];
    if (json['hearings'] != null) {
      hearings = [];
      json['hearings'].forEach((v) {
        hearings!.add(Hearings.fromJson(v));
      });
    }
  }
  String ?pageName;
  List<Hearings> ?hearings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_name'] = pageName;
    if (hearings != null) {
      map['hearings'] = hearings!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}