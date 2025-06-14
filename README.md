🚀 **Here’s a polished README for `age_calculator_helper`, ready for pub.dev with badges and links:**

---

# age\_calculator\_helper

[![Pub Version](https://img.shields.io/pub/v/age_calculator_helper.svg)](https://pub.dev/packages/age_calculator_helper)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Dart package to calculate age, time to next birthday, Indian zodiac sign, milestones, and date differences.

This package helps you easily compute age-related details and perform date calculations in Dart apps.

---

## ✨ Features

✅ Calculate precise age in years, months, and days
✅ Find time remaining until the next birthday
✅ Get Indian zodiac sign based on date of birth
✅ Compute difference between two dates
✅ Add a duration (years, months, days) to a date
✅ Suggest age-related milestones

---

## 🚀 Getting started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  age_calculator_helper: ^1.0.0
```

Import the package:

```dart
import 'package:age_calculator_helper/age_calculator_helper.dart';
```

---

## 📝 Usage

```dart
void main() {
  final helper = AgeCalculatorHelper(DateTime(1997, 3, 5));

  print('Age: ${helper.getAge()}');
  print('Next birthday: ${helper.timeToNextBirthday()}');
  print('Indian Zodiac: ${helper.getIndianZodiac()}');
  print('Milestones: ${helper.getMilestones()}');

  final diff = helper.dateDifference(
    fromDate: DateTime(2021, 1, 1),
    toDate: DateTime(2025, 5, 1),
  );
  print('Date difference: $diff');

  final futureDate = helper.addToDate(
    date: DateTime(2021, 1, 1),
    duration: DateDuration(years: 5, months: 2, days: 10),
  );
  print('Future date: $futureDate');
}
```

➡ More examples in the `/example` folder.

---

## 📚 Additional information

🔗 **Repository:** [https://github.com/SaranGreenz/age\_calculator\_helper](https://github.com/SaranGreenz/age_calculator_helper)
🐛 **Issue tracker:** [https://github.com/SaranGreenz/age\_calculator\_helper/issues](https://github.com/SaranGreenz/age_calculator_helper/issues)

💡 Contributions, feature requests, and bug reports are welcome!


