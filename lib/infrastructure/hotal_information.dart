class HotalModal {
  final String restaurantname;
  final String details;
  final String address;
  final String mobile;
  final String gstnumber;
  final bool isDinnig;
  final String imageURL;
  final String onnername;

  HotalModal(
      {required this.restaurantname,
      required this.onnername,
      required this.details,
      required this.imageURL,
      required this.address,
      required this.mobile,
      required this.gstnumber,
      required this.isDinnig});

  Map<String, dynamic> toJson() => {
        "Restorentname": restaurantname,
        "Details": details,
        'Address': address,
        'OnnerName': onnername,
        'Mobile': mobile,
        'GST': gstnumber,
        'IsDinning': isDinnig,
        'imageURL': imageURL,
        //'count': count
      };

  static HotalModal fromJson(Map<String, dynamic> json) => HotalModal(
      restaurantname: json["Restorentname"],
      details: json["Details"],
      imageURL: json["imageURL"],
      address: json["Address"],
      onnername: json["OnnerName"],
      mobile: json["Mobile"],
      gstnumber: json["GST"],
      isDinnig: json["IsDinning"]);
}
