class TodoEntity {
  int userId;
  int id;
  String title;
  bool completed;
  TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}
