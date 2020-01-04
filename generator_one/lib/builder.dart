import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/generator.dart';

Builder generatorOne(BuilderOptions options) =>
    PartBuilder([PartGenerator()], '.one.dart');
