class Todo {
  String task;
  bool isDone;

  Todo({
    required this.task,
    required this.isDone,
  });

  Todo.fromJson(Map<String, Object?> json)
      : this(
          task: json['task']! as String,
          isDone: json['isDone']! as bool,
        );

  Todo copyWith({String? task, bool? isDone}) {
    return Todo(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'task': task,
      'isDone': isDone,
    };
  }
}
