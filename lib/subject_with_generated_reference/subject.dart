import 'package:generator_one/generator_one.dart';
import 'package:generator_two/generator_two.dart';

part 'subject.one.dart';
part 'subject.two.dart';

@FirstAnnotation()
class Subject {

}

@SecondAnnotation()
class SubjectHelper extends Generic<GeneratedSubject>{}