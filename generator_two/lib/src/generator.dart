library generator_one.generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import '../generator_two.dart';

class PartGenerator extends GeneratorForAnnotation<SecondAnnotation> {
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

      String genericClassName = _getModel(element).name;

      return '''
class Generated$className {
  final $genericClassName obj;

  Generated$className(this.obj);
}
      ''';
    } catch (e, s) {
      return '/*\n$e\n$s\n*/';
    }
  }

  DartType _getModel(ClassElement clazz) {
    print(clazz.allSupertypes);
    final InterfaceType interface = clazz.allSupertypes
        .firstWhere((InterfaceType i) => i.name == 'Generic');

    var model = interface.typeArguments.first;

    if (model.isDynamic) {
      throw Exception("Cannot resolve type argument of the generic class!");
    }

    return model;
  }
}
