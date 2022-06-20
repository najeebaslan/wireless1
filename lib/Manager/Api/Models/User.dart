class User {
   String ?sId;
  late String? email;
  late String? username;
  late int ?numberAccount;
  User(
      { this.sId,
       this.email,
       this.username,
       this.numberAccount,
      });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    numberAccount = json['numberAccount'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['numberAccount'] = this.numberAccount;
    
    return data;
  }
}

class Profile {
  late String username, sId;
  late int exports, imports, numberAccount, balance;
  Profile(
      {required this.username,
      required this.sId,
      required this.balance,
      required this.numberAccount,
      required this.exports,
      required this.imports});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    sId = json['_id'];
    balance = json['balance'];
    numberAccount = json['numberAccount'];
    exports = json['exports'];
    imports = json['imports'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['_id'] = this.sId;
    data['balance'] = this.balance;
    data['numberAccount'] = this.numberAccount;
    data['exports'] = this.exports;
    data['imports'] = this.imports;
    return data;
  }
}
