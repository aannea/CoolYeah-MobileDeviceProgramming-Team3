import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:littlegrowth/view/pendidik/models/pendidik_todo.dart';

const String TODO_COLLECTION_REF = "todos";

class TodoService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference<Todo> _todosRef;

  TodoService() {
    _todosRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Todo>(
          fromFirestore: (snapshots, _) => Todo.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (todo, _) => todo.toJson(),
        );
  }

  Stream<QuerySnapshot<Todo>> getTodos() {
    return _todosRef.snapshots();
  }

  void addTodo(Todo todo) async {
    _todosRef.add(todo);
  }

  void updateTodo(String todoId, Todo todo) {
    _todosRef.doc(todoId).update(todo.toJson());
  }

  void deleteTodo(String todoId) {
    _todosRef.doc(todoId).delete();
  }
}
