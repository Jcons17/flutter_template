import 'package:flutter_template/core/domain/repository/example_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(
  as: ExampleRepository,
)
class ExampleRepositoryImpl implements ExampleRepository {}
