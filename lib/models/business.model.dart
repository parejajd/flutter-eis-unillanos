class Business {
  String name;
  String address;
  String contactName;
  String siteTypeName;
  String logo;
  int id;

  Business({
    required this.name,
    required this.address,
    required this.contactName,
    required this.siteTypeName,
    required this.id,
    required this.logo,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        name: json["name"] ?? '',
        address: json["address"] ?? '',
        contactName: json["contactName"] ?? '',
        siteTypeName: json["siteTypeName"] ?? '',
        logo: 'https://as2.ftcdn.net/v2/jpg/01/71/86/35/500_F_171863587_lbqZYspBATgdPhlA9XDhZmH3eMIlE2Cq.jpg',
        id: json["id"] ?? 0,
      );
}
