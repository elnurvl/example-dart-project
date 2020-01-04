library generator_two.generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

class PartGenerator extends GeneratorForAnnotation<FirstAnnotation> {
  const PartGenerator();

  @override
  Future<String> generateForAnnotatedElement(
      final Element element, ConstantReader annot, BuildStep buildStep) async {
    try {
      if (element is! ClassElement) {
        throw new Exception(
            "Annotated element needs to be a class.");
      }

      final String className = element.name;

      return '''
class Generated$className {}
      ''';
    } catch (e, s) {
      return '/*\n$e\n$s\n*/';
    }
  }
}
