class Character {
 late int charid;
  late String name;
  late String status;
  late String img;
 late String gender;
  String ?species;
  // Character({
  //   this.charid,
  //   this.name,
  //   required this.gender,
  //   required this.status,
  //   this.img,
  // });
  Character.fromJson(Map<String, dynamic> json) {
    charid = json['id'];
    name = json['name'];
    status = json['status'];
    gender = json['gender'];
    img = json['image'];
    species=json['species'];
  }
}
