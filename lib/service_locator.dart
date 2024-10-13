import 'package:dioreq/data/repository/todo_repository_impl.dart';
import 'package:dioreq/data/source/todo_api.dart';
import 'package:dioreq/domain/repository/todo_repository.dart';
import 'package:dioreq/domain/usecase/get_todo_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // service
  sl.registerSingleton<TodoApi>(TodoApiImpl());

  // Repository
  sl.registerSingleton<TodoRepository>(TodoRepositoryImpl());

  // Usecase
  sl.registerSingleton<GetTodoUseCase>(GetTodoUseCase());
}
