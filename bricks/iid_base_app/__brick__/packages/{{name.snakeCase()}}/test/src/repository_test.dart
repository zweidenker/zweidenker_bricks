import 'package:flutter_test/flutter_test.dart';
import 'package:{{name.snakeCase()}}/src/repository.dart';

void main() {
  test('Repository compiles', () {
    final repository = Repository();

    expect(repository, isNot(isNull));
  });
}