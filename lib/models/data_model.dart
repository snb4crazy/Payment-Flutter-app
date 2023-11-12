class DataModel {
  String brand_name;
  String brand_logo;
  int status;
  String due_info;
  String img;

  DataModel(
      {required this.brand_logo,
      required this.brand_name,
      required this.status,
      required this.due_info,
      required this.img});
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        brand_logo: json['brand_logo'],
        brand_name: json['brand_name'],
        status: json['status'],
        due_info: json['due_info'].toString(),
        img: json['img_address'],
      );
}
