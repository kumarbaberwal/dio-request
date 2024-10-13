import 'package:dartz/dartz.dart';
import 'package:dioreq/core/usecase/usecase.dart';
import 'package:dioreq/domain/entity/todo_entity.dart';
import 'package:dioreq/domain/repository/todo_repository.dart';
import 'package:dioreq/service_locator.dart';

class GetTodoUseCase extends Usecase<List<TodoEntity>, NoParams> {

  @override
  Future<Either<String, List<TodoEntity>>> call({NoParams? params}) async {
    return await sl<TodoRepository>().getTodo();
  }
}
