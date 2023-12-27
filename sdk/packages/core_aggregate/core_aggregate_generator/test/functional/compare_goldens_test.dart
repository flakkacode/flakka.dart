import 'dart:io';

import 'package:core_aggregate_generator/src/generator.dart';
import 'package:core_protoc/util/protoc_file_descriptor_set.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  final sourceDirectories = [
    Directory('test/functional/proto_dependencies').path,
    Directory('proto').path,
  ];
  final testProtoDirectories =
      Directory('test/functional/protos').listSync().whereType<Directory>();

  for (final directory in testProtoDirectories) {
    final name = p.basename(directory.path);
    test('generator golden: ${name}', () async {
      Map<String, String> result =
          runGenerator(Generator(), sourceDirectories, directory);
      assert(result.isNotEmpty, '');
    });
  }
  // .listSync(recursive: true)
  // .where((element) => element.path.endsWith('.proto'));
  // print(testProtoDirectories);
}
