class Job {
  final int id;
  final String title;
  final String description;
  final String experiencesYear;
  final String status;
  final String workingHour;
  final String closedDate;
  final String responsibility;
  final String requirement;
  final String benefits;
  final String createdAt;
  final String updatedAt;
  final int typeId;
  final int salaryId;
  final int companyId;
  final int categoryId;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.experiencesYear,
    required this.status,
    required this.workingHour,
    required this.closedDate,
    required this.responsibility,
    required this.requirement,
    required this.benefits,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
    required this.salaryId,
    required this.companyId,
    required this.categoryId,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      experiencesYear: json['experiences_year'] ?? '0',
      status: json['status'] ?? '',
      workingHour: json['working_hour'] ?? '',
      closedDate: json['closed_date'] ?? '',
      responsibility: json['responsibility'] ?? '',
      requirement: json['requirement'] ?? '',
      benefits: json['benefits'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      typeId: json['type_id'] ?? 0,
      salaryId: json['salary_id'] ?? 0,
      companyId: json['company_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
    );
  }
}
