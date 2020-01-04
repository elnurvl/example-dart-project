import 'package:generator_one/generator_one.dart';
import 'package:generator_two/generator_two.dart';

import 'existing_subject.dart';

part 'subject.one.dart';
part 'subject.two.dart';

@FirstAnnotation()
class SubjectTwo {}

@SecondAnnotation()
class SubjectTwoHelper extends Generic<ExistingSubject> {}