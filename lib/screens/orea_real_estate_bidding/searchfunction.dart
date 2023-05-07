class UserInfodata {
  String? id;
  String imageurl;
  String title;
  String desc;
  String? rent;
  String Useruid;

  UserInfodata({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.desc,
    required this.rent,
    required this.Useruid,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageurl': imageurl,
      'title': title,
      'desc': desc,
      'rent': rent,
      'Useruid': Useruid,
    };
  }

  static UserInfodata fromJson(Map<String, dynamic> json) => UserInfodata(
      id: json['id'],
      imageurl: json['imageurl'],
      title: json['title'],
      desc: json['desc'],
      rent: json['rent'],
      Useruid: json['Useruid']);
}
