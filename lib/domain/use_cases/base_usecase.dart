import 'package:spark_digital/imports.dart';

abstract class BaseUsecase<Input, Output> {
  const BaseUsecase();

  Future<Either<Failure, Output>> call({required Input params});
}
