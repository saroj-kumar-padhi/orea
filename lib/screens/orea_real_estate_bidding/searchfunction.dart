class UserInfodata {
  String? addedBy;
  String? amount;
  String? bidAmount;
  String? bidDecription;
  // String? createdAt;
  String? imageUrl;
  String? propertyDescription;
  String? propertyTitle;
  String? status;
  String? type;

  UserInfodata({
    required this.addedBy,
    required this.amount,
    required this.bidAmount,
    required this.bidDecription,
    // required this.createdAt,
    required this.imageUrl,
    required this.propertyDescription,
    required this.propertyTitle,
    required this.status,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'addedBy': addedBy,
      'amount': amount,
      'bidAmount': bidAmount,
      'bidDecription': bidDecription,
      // 'createdAt': createdAt,
      'imageUrl': imageUrl,
      'propertyDescription': propertyDescription,
      'propertyTitle': propertyTitle,
      'status': status,
      'type': type,
    };
  }

  static UserInfodata fromJson(Map<String, dynamic> json) => UserInfodata(
      addedBy: json['addedBy'],
      amount: json['amount'],
      bidAmount: json['bidAmount'],
      bidDecription: json['bidDecription'],
      // createdAt: json['createdAt'],
      imageUrl: json['imageUrl'],
      propertyDescription: json['propertyDescription'],
      propertyTitle: json['propertyTitle'],
      status: json['status'],
      type: json['type']);
}
