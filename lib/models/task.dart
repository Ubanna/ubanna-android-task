class Task {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  Task({this.id, this.name, this.createdAt, this.updatedAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}