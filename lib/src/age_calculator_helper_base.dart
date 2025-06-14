class AgeCalculatorHelper {
  final DateTime birthday;

  AgeCalculatorHelper(this.birthday);

  /// Get age as of today or a given date
  Map<String, int> getAge({DateTime? today}) {
    today ??= DateTime.now();

    int years = today.year - birthday.year;
    int months = today.month - birthday.month;
    int days = today.day - birthday.day;

    if (days < 0) {
      final prevMonth = DateTime(today.year, today.month, 0);
      days += prevMonth.day;
      months--;
    }

    if (months < 0) {
      months += 12;
      years--;
    }

    return {'years': years, 'months': months, 'days': days};
  }

  /// Time to next birthday
  Map<String, int> timeToNextBirthday({DateTime? fromDate}) {
    fromDate ??= DateTime.now();

    DateTime nextBday = DateTime(fromDate.year, birthday.month, birthday.day);
    if (fromDate.isAfter(nextBday) || fromDate.isAtSameMomentAs(nextBday)) {
      nextBday = DateTime(fromDate.year + 1, birthday.month, birthday.day);
    }

    return dateDifference(fromDate: fromDate, toDate: nextBday);
  }

  /// Date difference
  static Map<String, int> dateDifference({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    int years = toDate.year - fromDate.year;
    int months = toDate.month - fromDate.month;
    int days = toDate.day - fromDate.day;

    if (days < 0) {
      final prevMonth = DateTime(toDate.year, toDate.month, 0);
      days += prevMonth.day;
      months--;
    }

    if (months < 0) {
      months += 12;
      years--;
    }

    return {'years': years, 'months': months, 'days': days};
  }

  /// Add duration
  static DateTime addDuration({
    required DateTime date,
    required Map<String, int> duration,
  }) {
    DateTime result = DateTime(
      date.year + (duration['years'] ?? 0),
      date.month + (duration['months'] ?? 0),
      date.day,
    );

    while (result.month > 12) {
      result = DateTime(result.year + 1, result.month - 12, result.day);
    }

    result = result.add(Duration(days: duration['days'] ?? 0));
    return result;
  }

  /// Is today birthday
  bool isTodayBirthday({DateTime? today}) {
    today ??= DateTime.now();
    return today.month == birthday.month && today.day == birthday.day;
  }

  /// Total difference
  Map<String, int> totalDifference({DateTime? today}) {
    today ??= DateTime.now();
    final diff = today.difference(birthday);

    return {
      'total_days': diff.inDays,
      'total_weeks': diff.inDays ~/ 7,
      'total_months':
          (today.year - birthday.year) * 12 + today.month - birthday.month,
      'total_years': today.year - birthday.year,
    };
  }

  /// Days left in year
  int daysLeftInYear({DateTime? fromDate}) {
    fromDate ??= DateTime.now();
    final endOfYear = DateTime(fromDate.year, 12, 31);
    return endOfYear.difference(fromDate).inDays;
  }

  /// Western zodiac sign
  String getZodiacSign() {
    int day = birthday.day;
    int month = birthday.month;
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return 'Aquarius';
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return 'Pisces';
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'Aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'Taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'Gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'Cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'Leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'Virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'Libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return 'Scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return 'Sagittarius';
    return 'Capricorn';
  }

  /// Indian zodiac sign (Rashi)
  String getIndianZodiac() {
    int day = birthday.day;
    int month = birthday.month;
    if ((month == 4 && day >= 14) || (month == 5 && day <= 14))
      return 'Mesha (Aries)';
    if ((month == 5 && day >= 15) || (month == 6 && day <= 14))
      return 'Vrishabha (Taurus)';
    if ((month == 6 && day >= 15) || (month == 7 && day <= 14))
      return 'Mithuna (Gemini)';
    if ((month == 7 && day >= 15) || (month == 8 && day <= 14))
      return 'Karka (Cancer)';
    if ((month == 8 && day >= 15) || (month == 9 && day <= 15))
      return 'Simha (Leo)';
    if ((month == 9 && day >= 16) || (month == 10 && day <= 15))
      return 'Kanya (Virgo)';
    if ((month == 10 && day >= 16) || (month == 11 && day <= 14))
      return 'Tula (Libra)';
    if ((month == 11 && day >= 15) || (month == 12 && day <= 14))
      return 'Vrischika (Scorpio)';
    if ((month == 12 && day >= 15) || (month == 1 && day <= 13))
      return 'Dhanu (Sagittarius)';
    if ((month == 1 && day >= 14) || (month == 2 && day <= 12))
      return 'Makara (Capricorn)';
    if ((month == 2 && day >= 13) || (month == 3 && day <= 12))
      return 'Kumbha (Aquarius)';
    return 'Meena (Pisces)';
  }

  /// Decimal age
  double getDecimalAge({DateTime? today}) {
    today ??= DateTime.now();
    final diff = today.difference(birthday).inDays;
    return diff / 365.25;
  }

  /// Age group
  String getAgeGroup({DateTime? today}) {
    final ageMap = getAge(today: today);
    int years = ageMap['years'] ?? 0;
    if (years < 13) return 'Child';
    if (years < 20) return 'Teen';
    if (years < 60) return 'Adult';
    return 'Senior';
  }

  /// Birthdays on specific weekday
  List<int> birthdaysOnWeekday(int weekday) {
    List<int> years = [];
    DateTime now = DateTime.now();
    for (int y = birthday.year; y <= now.year; y++) {
      DateTime bday = DateTime(y, birthday.month, birthday.day);
      if (bday.weekday == weekday) {
        years.add(y);
      }
    }
    return years;
  }

  /// Next milestone
  Map<String, dynamic> nextMilestone({DateTime? today}) {
    today ??= DateTime.now();
    int age = getAge(today: today)['years']!;
    int nextMilestoneAge = ((age ~/ 10) + 1) * 10;
    DateTime milestoneDate = DateTime(
        birthday.year + nextMilestoneAge, birthday.month, birthday.day);
    var diff = dateDifference(fromDate: today, toDate: milestoneDate);
    return {
      'milestone_age': nextMilestoneAge,
      'in': diff,
    };
  }
}
