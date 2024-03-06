class AuthModel {
  AuthModel({
      this.message, 
      this.userId,
  });

  AuthModel.fromJson(dynamic json) {
    message = json['message'];
    userId = json['user_id'];
  }
  String ?message;
  int ?userId;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['user_id'] = userId;
    return map;
  }

}