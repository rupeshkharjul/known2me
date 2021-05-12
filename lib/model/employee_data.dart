class EmployeeData {
  int id;
  String imageUrl;
  String firstName;
  String lastName;
  String email;
  String contactNumber;
  int age;
  String dob;
  double salary;
  String address;

  EmployeeData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['imageUrl'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        contactNumber = json['contactNumber'],
        age = json['age'],
        dob = json['dob'],
        salary = json['salary'],
        address = json['address'];
}
