class Job {
  final String title;
  final int typeId;
  final int salaryId;
  final String description;
  final int experiencesYear;
  final String status;
  final String workingHour;
  final String closedDate;
  final int companyId;
  final String responsibility;
  final String requirement;
  final String benefits;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  Job({
    required this.title,
    required this.typeId,
    required this.salaryId,
    required this.description,
    required this.experiencesYear,
    required this.status,
    required this.workingHour,
    required this.closedDate,
    required this.companyId,
    required this.responsibility,
    required this.requirement,
    required this.benefits,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      typeId: json['type_id'],
      salaryId: json['salary_id'],
      description: json['description'],
      experiencesYear: json['experiences_year'],
      status: json['status'],
      workingHour: json['working_hour'],
      closedDate: json['closed_date'],
      companyId: json['company_id'],
      responsibility: json['responsibility'],
      requirement: json['requirement'],
      benefits: json['benefits'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type_id': typeId,
      'salary_id': salaryId,
      'description': description,
      'experiences_year': experiencesYear,
      'status': status,
      'working_hour': workingHour,
      'closed_date': closedDate,
      'company_id': companyId,
      'responsibility': responsibility,
      'requirement': requirement,
      'benefits': benefits,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
