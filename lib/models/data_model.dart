class DataModel {
  String brand_name;
  String brand_logo;
  int status;
  String due_info;
  String img;
  int id;

  DataModel(
      {required this.brand_logo,
      required this.brand_name,
      required this.status,
      required this.due_info,
      required this.img,
      required this.id});
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      //empty json['brand_logo'] - set default image or 'No image logo, put default'
      brand_logo:
          json['brand_logo'] == null ? 'images/brand1.png' : json['brand_logo'],
      brand_name: json['brand_name'],
      status: json['status'],
      due_info: json['due_info'].toString(),
      img: json['img_address'],
      id: json['id']);
}
