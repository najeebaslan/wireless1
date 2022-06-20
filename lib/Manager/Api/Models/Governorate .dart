// class Governorate {
//   final String? governorate,
//   city,village;

//   const Governorate({
//     this.city,
//     this.village,
//     this.governorate,
//   });

//   static Governorate fromJson(Map<String, dynamic> json) => Governorate(
//     governorate: json['governorate'],
//         city: json['city'],

//         village: json['village'],

//       );
// }

class Governorate {
  String? governorate;
  String? city;
  String? village;

  Governorate({this.governorate, this.city, this.village});

  Governorate.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    city = json['city'];
    village = json['village'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['governorate'] = this.governorate;
    data['city'] = this.city;
    data['village'] = this.village;
    return data;
  }
}



class LocationNetwork {
  String? sId;
  String? governorate;
  List<String>? cities;
  List<String>? streets;

  LocationNetwork({this.sId, this.governorate, this.cities, this.streets});

  LocationNetwork.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    governorate = json['governorate'];
    cities = json['cities'].cast<String>();
    streets = json['streets'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['governorate'] = this.governorate;
    data['cities'] = this.cities;
    data['streets'] = this.streets;
    return data;
  }
}

class Street {
  String? name;
  String? sId;

  Street({this.name, this.sId});

  Street.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}

class LocationGovernorate {
  final String? governorate, id;

  const LocationGovernorate({
    this.governorate,
    this.id,
  });

  static LocationGovernorate fromJson(Map<String, dynamic> json) => LocationGovernorate(
        governorate: json['governorate'],
        id: json['_id'],
     
      );
}
class LocationCity {
  final String? name, id;

  const LocationCity({
    this.name,
    this.id,
  });

  static LocationCity fromJson(Map<String, dynamic> json) => LocationCity(
        name: json['name'],
        id: json['_id'],
     
      );
}
