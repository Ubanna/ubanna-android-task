class Task {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int amount;

  Task({this.id, this.name, this.createdAt, this.updatedAt, this.amount});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      amount: json['amount'],
    );
  }
}
