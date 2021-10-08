class Cards {
  late List<Data> data;

  Cards({required this.data});

  Cards.fromJson(Map<String, dynamic> json) {
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
  late String maskedPan;
  late String type;

  Data({required this.id, required this.maskedPan, required this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maskedPan = json['masked_pan'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masked_pan'] = this.maskedPan;
    data['type'] = this.type;
    return data;
  }
}

