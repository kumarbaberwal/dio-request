import 'package:dartz/dartz.dart';

abstract class Usecase<Type, Params> {
  Future<Either<String, Type>> call({Params? params});
}

class NoParams {}