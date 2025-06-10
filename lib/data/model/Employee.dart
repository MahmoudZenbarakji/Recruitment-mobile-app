class Employee {
  final int userId;
  final String fullName;
  final String educationLevel;
  final int experienceYear;
  final int salaryId;
  final int nationalityId;
  final String gender;
  final String? otherPhoneNumber;
  final String birthDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  Employee({
    required this.userId,
    required this.fullName,
    required this.educationLevel,
    required this.experienceYear,
    required this.salaryId,
    required this.nationalityId,
    required this.gender,
    this.otherPhoneNumber,
    required this.birthDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      userId: json['user_id'],
      fullName: json['full_name'],
      educationLevel: json['education_level'],
      experienceYear: json['experience_year'],
      salaryId: json['salary_id'],
      nationalityId: json['nationality_id'],
      gender: json['gender'],
      otherPhoneNumber: json['other_phone_number'],
      birthDate: json['birth_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'full_name': fullName,
      'education_level': educationLevel,
      'experience_year': experienceYear,
      'salary_id': salaryId,
      'nationality_id': nationalityId,
      'gender': gender,
      'other_phone_number': otherPhoneNumber,
      'birth_date': birthDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
