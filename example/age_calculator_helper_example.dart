import 'package:age_calculator_helper/age_calculator_helper.dart';

void main() {
  final helper = AgeCalculatorHelper(DateTime(1997, 3, 5));

  print('Age: ${helper.getAge()}');
  print('Next birthday: ${helper.timeToNextBirthday()}');
  print('Indian Zodiac: ${helper.getIndianZodiac()}');
}
