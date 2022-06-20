//old
import 'dart:convert';

import 'package:http/http.dart';

class Allcaverage_erea {
  String? id;
  late String allcaverageErea;
  late String? networkid;

  Allcaverage_erea({
    this.id,
    required this.allcaverageErea,
    this.networkid,
  });

  Allcaverage_erea.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    allcaverageErea = json['Allcaverage_erea'];
    networkid = json['networkid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['Allcaverage_erea'] = this.allcaverageErea;
    data['networkid'] = this.networkid;

    return data;
  }
}

// class EreaNotidnetwork {
//   String? id;
//    String? name;
//   EreaNotidnetwork({
//     this.id,
//     required this.name,
//   });
//   EreaNotidnetwork.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

class CoverageArea {
  String id;
  String name;

  CoverageArea(this.id, this.name);

  factory CoverageArea.fromJson(dynamic json) {
    return CoverageArea(json['_id'] as String, json['name'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.name} }';
  }
}