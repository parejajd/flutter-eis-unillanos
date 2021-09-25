class Cities {
  String name;
  int departamentId;
  int id;

  Cities({
    required this.name,
    required this.departamentId,
    required this.id,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        name: json["name"] ?? '',
        departamentId: json["departamentId"] ?? '',
        id: json["id"] ?? '',
      );
}
