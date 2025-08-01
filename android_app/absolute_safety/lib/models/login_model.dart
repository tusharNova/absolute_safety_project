class LoginModel {
  String status;
  String role;
  User user;

  LoginModel({required this.status, required this.role, required this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    role: json["role"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "role": role,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String contact;
  String area;
  String experienceYears;
  DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contact,
    required this.area,
    required this.experienceYears,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    contact: json["contact"],
    area: json["area"],
    experienceYears: json["experience_years"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "contact": contact,
    "area": area,
    "experience_years": experienceYears,
    "created_at": createdAt.toIso8601String(),
  };
}
