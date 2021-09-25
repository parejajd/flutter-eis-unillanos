class Cities {
  String name;
  String departamentId;

  Cities({
    required this.name,
    required this.departamentId,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        name: json["name"] ?? '',
        departamentId: json["departamentId"] ?? '',
      );
}
