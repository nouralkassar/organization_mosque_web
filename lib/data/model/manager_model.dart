class ManagerModel {
  int? id; // ✅ هذا هو المعرف الأساسي
  String? full_name;
  String? motherName;
  String? birthDate;
  String? nationalId;
  String? address;
  String? previousJob;
  String? educationLevel;
  String? phone;
  String? role;
  String? mosqueId;

  ManagerModel({
    this.id,
    this.full_name,
    this.motherName,
    this.birthDate,
    this.nationalId,
    this.address,
    this.previousJob,
    this.educationLevel,
    this.phone,
    this.role,
    this.mosqueId,
  });

  ManagerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    full_name = json['full_name'];
    motherName = json['mother_name'];
    birthDate = json['birth_date'];
    nationalId = json['national_id'];
    address = json['address'];
    previousJob = json['previous_job'];
    educationLevel = json['education_level'];
    phone = json['phone'];
    role = json['role'] ?? '';
    mosqueId = json['mosque_id'] != null ? json['mosque_id'].toString() : '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = full_name;
    data['mother_name'] = motherName;
    data['birth_date'] = birthDate;
    data['national_id'] = nationalId;
    data['address'] = address;
    data['previous_job'] = previousJob;
    data['education_level'] = educationLevel;
    data['phone'] = phone;
    data['role'] = role;
    data['mosque_id'] = mosqueId;
    return data;
  }
}
