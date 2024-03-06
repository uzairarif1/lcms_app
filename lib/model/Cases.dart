import 'Details.dart';

class Cases {
  Cases({
      this.details, 
      this.lawyers,});

  Cases.fromJson(dynamic json) {
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    lawyers = json['lawyers'] != null ? json['lawyers'].cast<String>() : [];
  }
  Details ?details;
  List<String> ?lawyers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (details != null) {
      map['details'] = details!.toJson();
    }
    map['lawyers'] = lawyers;
    return map;
  }

}