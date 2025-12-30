class Employee {
  final int id;
  final String firstName;
  final String lastName;
  final String department; // company.department
  final String image;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.image,
  });

  String get fullName => "$firstName $lastName";

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json["id"] ?? 0,
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      department: (json["company"]?["department"]) ?? "N/A",
      image: json["image"] ?? "",
    );
  }
}
