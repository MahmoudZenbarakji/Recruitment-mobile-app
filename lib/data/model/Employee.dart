class Media {
  final int id;
  final String originalUrl;
  final String previewUrl;

  Media(
      {required this.id, required this.originalUrl, required this.previewUrl});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      originalUrl: json['original_url'],
      previewUrl: json['preview_url'],
    );
  }
}

class Employee {
  final int id;
  final String fullName;
  final String educationLevel;
  final int experienceYear;
  final String gender;
  final String otherPhoneNumber;
  final String birthDate;
  final List<Media> media;

  Employee({
    required this.id,
    required this.fullName,
    required this.educationLevel,
    required this.experienceYear,
    required this.gender,
    required this.otherPhoneNumber,
    required this.birthDate,
    required this.media,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      fullName: json['full_name'],
      educationLevel: json['education_level'],
      experienceYear: json['experience_year'],
      gender: json['gender'],
      otherPhoneNumber: json['other_phone_number'],
      birthDate: json['birth_date'],
      media: (json['media'] as List).map((m) => Media.fromJson(m)).toList(),
    );
  }

  String get image => media.isNotEmpty
      ? media.first.previewUrl
      : 'https://via.placeholder.com/150';
}
