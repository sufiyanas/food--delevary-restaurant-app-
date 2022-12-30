class HotalModal {
  final String restaurantname;
  final String details;
  final String address;
  final String email;
  final String mobile;
  final String gstnumber;
  final bool isDinnig;
  final String imageURL;

  HotalModal(
      {required this.restaurantname,
      required this.details,
      required this.imageURL,
      required this.address,
      required this.email,
      required this.mobile,
      required this.gstnumber,
      required this.isDinnig});

  Map<String, dynamic> toJson() => {
        "Restorentname": restaurantname,
        "Details": details,
        'Address': address,
        'Email': email,
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
      email: json["Email"],
      mobile: json["Mobile"],
      gstnumber: json["GST"],
      isDinnig: json["IsDinning"]);
}
