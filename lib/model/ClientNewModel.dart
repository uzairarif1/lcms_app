class ClientNewModel {
  ClientNewModel({
      this.id, 
      this.firstname, 
      this.lastname, 
      this.address, 
      this.email, 
      this.phone, 
      this.govId, 
      this.description, 
      this.image, 
      this.dateCreated, 
      this.status, 
      this.username, 
      this.password,});

  ClientNewModel.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    govId = json['gov_id'];
    description = json['description'];
    image = json['image'];
    dateCreated = json['date_created'];
    status = json['status'];
    username = json['username'];
    password = json['password'];
  }
  int ?id;
  String ?firstname;
  String ?lastname;
  String ?address;
  String ?email;
  String ?phone;
  String ?govId;
  String ?description;
  String ?image;
  String ?dateCreated;
  String ?status;
  String ?username;
  String ?password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['address'] = address;
    map['email'] = email;
    map['phone'] = phone;
    map['gov_id'] = govId;
    map['description'] = description;
    map['image'] = image;
    map['date_created'] = dateCreated;
    map['status'] = status;
    map['username'] = username;
    map['password'] = password;
    return map;
  }

}