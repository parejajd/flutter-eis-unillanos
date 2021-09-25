class Business {
  String name;
  String address;
  String contactName;
  String siteTypeName;

  Business({
    required this.name,
    required this.address,
    required this.contactName,
    required this.siteTypeName,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        name: json["name"] ?? '',
        address: json["address"] ?? '',
        contactName: json["contactName"] ?? '',
        siteTypeName: json["siteTypeName"] ?? '',
      );
}
