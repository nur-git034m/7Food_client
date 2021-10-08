// ignore_for_file: file_names

class User {
  late Data data;

  User({required this.data});

  User.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
 late String name;
 late String phone;
   late String bonus;

  Data({required this.name, required this.phone, required this.bonus});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['bonus'] = this.bonus;
    return data;
  }
  



}