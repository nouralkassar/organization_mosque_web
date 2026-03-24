class DurationModel {
  int? id;
  int? mosqueId;
  int? staffId;
  String? name;
  String? type;
  String? daysOfWeek;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  DurationModel({
    this.id,
    this.mosqueId,
    this.staffId,
    this.name,
    this.type,
    this.daysOfWeek,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  DurationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mosqueId = json['mosque_id'];
    staffId = json['staff_id'];
    name = json['name'];
    type = json['type'];
    daysOfWeek = json['daysOfWeek'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['id'] = id;
    dataMap['mosque_id'] = mosqueId;
    dataMap['staff_id'] = staffId;
    dataMap['name'] = name;
    dataMap['type'] = type;
    dataMap['daysOfWeek'] = daysOfWeek;
    dataMap['start_time'] = startTime;
    dataMap['end_time'] = endTime;
    dataMap['created_at'] = createdAt;
    dataMap['updated_at'] = updatedAt;
    return dataMap;
  }
}
