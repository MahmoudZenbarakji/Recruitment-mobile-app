class CompanyModel {
  final String name;
  final String logoUrl;
  final String description;
  final String country;
  final String city;

  CompanyModel({
    required this.name,
    required this.logoUrl,
    required this.description,
    required this.country,
    required this.city,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      logoUrl: json['logo_url'],
      description: json['description'],
      country: json['country'],
      city: json['city'],
    );
  }
}
