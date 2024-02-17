class Usermodel {
  String? name;
  String? mobNo;
  String? email;
  String? gender;
  bool isOnline = false;
  int? status = 1; // 1 -> active 2-> inactive 3-> suspend
  String? profile = "";
  int? profileStatus = 1; // 1 -> public 2-> private 3-> onlyfreinds

  Usermodel(
      {required this.name,
      required this.mobNo,
      required this.email,
      required this.gender,
      required this.isOnline,
      required this.status,
      required this.profile,
      required this.profileStatus});

  factory Usermodel.fromDoc(Map<String, dynamic> map) {
    return Usermodel(
        name: map["name"],
        mobNo: map["mobNo"],
        email: map["email"],
        gender: map["gender"],
        isOnline: map["isOnline"],
        status: map["status"],
        profile: map["profile"],
        profileStatus: map["profileStatus"]);
  }
  Map<String, dynamic> toDoc() {
    return {
      "name": name,
      "mobNo": mobNo,
      "email": email,
      "gender": gender,
      "isOnline": isOnline,
      "status": status,
      "profile": profile,
      "profileStatus": profileStatus
    };
  }
}
