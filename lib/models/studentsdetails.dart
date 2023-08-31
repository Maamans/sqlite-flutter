class StudentDetails {
  final String name;
  final String course;
  final String regnumber;
  final String departments;
  final String gender;
  final String facility;
  final String agecategory;
  final String area;
  
  StudentDetails({required this.name, required this.course,  required this.regnumber, 
  required this.departments, required this.gender, required this.agecategory, required this.area, required this.facility});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'regnumber': regnumber,
      'departments': departments,
      'gender': gender,
      'facility': facility,
      'agecategory': agecategory,
      'area': area,
    };
  }
}
