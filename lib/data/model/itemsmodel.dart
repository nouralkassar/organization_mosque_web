class ItemsModel{
  int? id;
  int? cityId;
  String? name;
  String? address;
  int? area;
  String? details;
  String? technicalStatus;
  String? category;
  bool? hasFemaleSection;
  String? imageUrl;

  ItemsModel(
      {this.id,
  this.cityId,
  this.name,
  this.address,
  this.area,
  this.details,
  this.technicalStatus,
  this.category,
  this.hasFemaleSection,
  this.imageUrl,});

  ItemsModel.fromjson(Map<String,dynamic> json){
    id = json['id'];
    cityId = json['city_id'];
    name = json['name'];
    address = json['address'];
    area = json['area'];
    details = json['details'];
    technicalStatus = json['technical_status'];
    category = json['category'];
    hasFemaleSection = json['has_female_section'];
    imageUrl = json['image_url'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = id;
    data['city_id'] = cityId;
    data['name'] = name;
    data['address'] = address;
    data['area'] = area;
    data['details'] = details;
    data['technical_status'] = technicalStatus;
    data['category'] = category;
    data['has_female_section'] = hasFemaleSection;
    data['image_url'] = imageUrl;
    return data;
  }
}