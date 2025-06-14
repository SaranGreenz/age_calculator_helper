import 'package:test/test.dart';
import 'package:age_calculator_helper/age_calculator_helper.dart';

void main() {
  test('Age calculation works', () {
    final helper = AgeCalculatorHelper(DateTime(2000, 1, 1));
    final age = helper.getAge(today: DateTime(2020, 1, 1));
    expect(age['years'], 20);
  });

  test('Indian zodiac calculation works', () {
    final helper = AgeCalculatorHelper(DateTime(1997, 3, 15));
    expect(helper.getIndianZodiac(), 'Meena (Pisces)');
  });
}
