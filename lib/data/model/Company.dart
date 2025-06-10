class Company {
  final String companyName;
  final String description;
  final String website;
  final String size;
  final String since;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  Company({
    required this.companyName,
    required this.description,
    required this.website,
    required this.size,
    required this.since,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['company_name'],
      description: json['description'],
      website: json['website'],
      size: json['size'],
      since: json['since'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_name': companyName,
      'description': description,
      'website': website,
      'size': size,
      'since': since,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
