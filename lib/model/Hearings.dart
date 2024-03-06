class Hearings {
  Hearings({
      this.id,
      this.date,
      this.caseId, 
      this.caseName, 
      this.judgement, 
      this.hearingStatus, 
      this.judge, 
      this.lawyers,});

  Hearings.fromJson(dynamic json) {
    id = json['id'];
    date=json['date'];
    caseId = json['case_id'];
    caseName = json['case_name'];
    judgement = json['judgement'];
    hearingStatus = json['hearing_status'];
    judge = json['judge'];
    lawyers = json['lawyers'] != null ? json['lawyers'].cast<String>() : [];
  }
  int ?id;
  String ?date;
  int ?caseId;
  String ?caseName;
  String ?judgement;
  String ?hearingStatus;
  String ?judge;
  List<String> ?lawyers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    map['case_id'] = caseId;
    map['case_name'] = caseName;
    map['judgement'] = judgement;
    map['hearing_status'] = hearingStatus;
    map['judge'] = judge;
    map['lawyers'] = lawyers;
    return map;
  }

}