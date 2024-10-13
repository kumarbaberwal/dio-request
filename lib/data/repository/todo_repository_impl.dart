import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dioreq/data/model/todo_model.dart';
import 'package:dioreq/data/source/todo_api.dart';
import 'package:dioreq/domain/entity/todo_entity.dart';
import 'package:dioreq/domain/repository/todo_repository.dart';
import 'package:dioreq/service_locator.dart';

class TodoRepositoryImpl extends TodoRepository {

  @override
  Future<Either<String, List<TodoEntity>>> getTodo() async {
    Either<String, Response> result = await sl<TodoApi>().getTodo();
    return result.fold(
      (error) => Left(error),
      (response) {
        try {
          List<dynamic> dataList = response.data as List<dynamic>;
          List<TodoEntity> entities = dataList
              .map((data) => TodoModel.fromMap(data).toEntity())
              .toList();
          return Right(entities);
        } catch (e) {
          return Left("Data parsing error: ${e.toString()}");
        }
      },
    );
  }
}
