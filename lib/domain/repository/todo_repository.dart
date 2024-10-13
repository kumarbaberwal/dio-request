import 'package:dartz/dartz.dart';
import 'package:dioreq/domain/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<String, List<TodoEntity>>> getTodo();
}
