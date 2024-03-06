class Details {
  Details({
      this.id, 
      this.caseNo, 
      this.title, 
      this.startDate, 
      this.description, 
      this.dateCreated, 
      this.type, 
      this.status, 
      this.client, 
      this.judge,});

  Details.fromJson(dynamic json) {
    id = json['id'];
    caseNo = json['case_no'];
    title = json['title'];
    startDate = json['start_date'];
    description = json['description'];
    dateCreated = json['date_created'];
    type = json['type'];
    status = json['status'];
    client = json['client'];
    judge = json['judge'];
  }
  int ?id;
  String ?caseNo;
  String ?title;
  String ?startDate;
  String ?description;
  String ?dateCreated;
  String ?type;
  String ?status;
  int ?client;
  int ?judge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['case_no'] = caseNo;
    map['title'] = title;
    map['start_date'] = startDate;
    map['description'] = description;
    map['date_created'] = dateCreated;
    map['type'] = type;
    map['status'] = status;
    map['client'] = client;
    map['judge'] = judge;
    return map;
  }

}