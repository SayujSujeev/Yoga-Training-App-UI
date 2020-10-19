
import 'package:yoga_training_app/models/course.dart';
import 'package:yoga_training_app/models/style.dart';

final _standStyle = Style(
  imageUrl: 'assets/images/pose2.png',
  name: 'Standing Style',
  time: 5,
);
final _sittingStyle = Style(
  imageUrl: 'assets/images/pose1.png',
  name: 'Sitting Style',
  time: 8,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/images/pose3.png',
  name: 'Leg Cross Style',
  time: 6,
);

final styles = [_standStyle,_sittingStyle,_legCrossStyle];

final _course1 = Course(
  imageUrl: 'assets/images/course1.jpg',
  name: 'Advance Stretchings',
  time: 45,
  students: 'Advanced'
);

final _course2 = Course(
    imageUrl: 'assets/images/course2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate'
);

final _course3 = Course(
    imageUrl: 'assets/images/course3.jpg',
    name: 'Meditation',
    time: 20,
    students: 'Beginner'
);

final List<Course> courses = [_course1,_course3,_course2];