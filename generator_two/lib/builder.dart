import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/generator.dart';

Builder generatorTwo(BuilderOptions options) =>
    PartBuilder([PartGenerator()], '.two.dart');
