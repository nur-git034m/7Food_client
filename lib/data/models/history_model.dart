// ignore_for_file: file_names


class History {
   late List<Data> data;

  History({required this.data});

  History.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
 late int id;
late  String address;
 late String price;
 late String createdAt;
 late List<Details> details;

  Data({required this.id, required this.address, required this.price, required this.createdAt, required this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    price = json['price'];
    createdAt = json['created_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
 late  String name;
 late int quantity;

  Details({required this.name, required this.quantity});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}