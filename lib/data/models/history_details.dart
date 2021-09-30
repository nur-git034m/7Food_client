// ignore_for_file: file_names

class HistoryDetails {
  late Data data;

  HistoryDetails({required this.data});

  HistoryDetails.fromJson(Map<String, dynamic> json) {
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
  late int id;
  late String date;
  late String time;
  late String address;
  late String total;
  late List<Details> details;

  Data(
      {required this.id,
      required this.date,
      required this.time,
      required this.address,
      required this.total,
      required this.details});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    total = json['total'];
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
    data['date'] = this.date;
    data['time'] = this.time;
    data['address'] = this.address;
    data['total'] = this.total;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  late String name;
  late String price;
  late String quantity;
  late String image;
  late String sum;

  Details(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.image,
      required this.sum});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['sum'] = this.sum;
    return data;
  }
}