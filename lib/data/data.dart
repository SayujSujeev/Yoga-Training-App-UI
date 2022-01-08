

import 'package:UnivTodo/models/course.dart';
import 'package:UnivTodo/models/style.dart';

final _standStyle = Style(
  imageUrl: 'assets/images/pf1.png',
  name: 'User 1',
  time: 400,
);
final _sittingStyle = Style(
  imageUrl: 'assets/images/pf2.png',
  name: 'User 2',
  time: 442,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/images/pf1.png',
  name: 'User 3',
  time: 623,
);

final styles = [_standStyle,_sittingStyle,_legCrossStyle];

final _course1 = Course(
  imageUrl: 'assets/images/cs.jpeg',
  name: 'System Programming',
  time: 95,
  students: 'CS230'
);

final _course2 = Course(
    imageUrl: 'assets/images/os.jpeg',
    name: 'Operating Systems',
    time: 95,
    students: 'CS350'
);

final _course3 = Course(
    imageUrl: 'assets/images/ca.jpg',
    name: 'Computer Architecture',
    time: 95,
    students: 'CS300'
);

final List<Course> courses = [_course1,_course3,_course2];