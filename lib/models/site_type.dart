class SiteType {
  String name;
  String normalizedName;
  String icon;
  bool isFeatured;
  int level;
  DateTime createdOn;
  DateTime updatedOn;
  int id;

  SiteType({
    required this.name,
    required this.normalizedName,
    required this.icon,
    required this.isFeatured,
    required this.level,
    required this.createdOn,
    required this.updatedOn,
    required this.id,
  });

  factory SiteType.fromJson(Map<String, dynamic> json) {
    return SiteType(
        name: json['name'] ?? "",
        normalizedName: json['normalizedName'],
        icon: json['icon'] ?? "",
        isFeatured: json['isFeatured'] ?? false,
        level: json['level'],
        createdOn: json['createdOn'] == null
            ? DateTime.now()
            : DateTime.parse(json['createdOn']),
        updatedOn: json['updatedOn'] == null
            ? DateTime.now()
            : DateTime.parse(json['updatedOn']),
        id: json['id']);
  }
}
