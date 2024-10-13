import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class TodoApi {
  Future<Either<String, Response>> getTodo();
}

class TodoApiImpl extends TodoApi {
  final dio = Dio();

  @override
  Future<Either<String, Response>> getTodo() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/todos/");
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
