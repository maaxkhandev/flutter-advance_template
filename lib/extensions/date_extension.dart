import 'package:intl/intl.dart';

extension DateOnlyCompare on DateTime {
  // Checks if the date is today.
  bool get isToday {
    return isSameDate(DateTime.now());
  }

  // Checks if the date is yesterday.
  bool get isYesterday {
    return isSameDate(DateTime.now().subtract(const Duration(days: 1)));
  }

  // Checks if two dates are the same.
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // Checks if two dates are in the same week.
  bool isSameWeek(DateTime other) {
    final startOfWeek = subtract(Duration(days: weekday - 1));
    final endOfWeek = add(Duration(days: DateTime.daysPerWeek - weekday));
    return other.isAfter(startOfWeek) && other.isBefore(endOfWeek);
  }

  // Checks if the date is this week.
  bool isThisWeek() {
    return isSameWeek(DateTime.now());
  }

  // Checks if the date is last week.
  bool isLastWeek() {
    return isSameWeek(DateTime.now().subtract(const Duration(days: 7)));
  }

  // Checks if the date is this month.
  bool isThisMonth() {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  // Checks if the date is last month.
  bool isLastMonth() {
    final lastMonth = DateTime.now().subtract(const Duration(days: 30));
    return year == lastMonth.year && month == lastMonth.month;
  }

  String toLongDate() =>
      DateFormat('dd MMMM yyyy').format(this); // Example output: "20 June 2020"

  String toLongDateWithDay() => DateFormat('EEEE, dd MMMM yyyy')
      .format(this); // Example output: "Saturday, 20 June 2020"

  String toIso8601() =>
      toIso8601String(); // Example output: "2020-06-20T00:00:00.000"

  String toYMD() =>
      DateFormat('yyyy-MM-dd').format(this); // Example output: "2020-06-20"

  String toDMY() =>
      DateFormat('dd/MM/yyyy').format(this); // Example output: "20/06/2020"

  String toMDY() =>
      DateFormat('MM/dd/yyyy').format(this); // Example output: "06/20/2020"

  String toFullDate() => DateFormat('EEEE, MMMM d, yyyy')
      .format(this); // Example output: "Saturday, June 20, 2020"

  String toShortDate() =>
      DateFormat('MM/dd/yy').format(this); // Example output: "06/20/20"
  String toLongTime() =>
      DateFormat('HH:mm:ss').format(this); // 24-hour format: "10:11:52"

  String toShortTime() =>
      DateFormat('HH:mm').format(this); // 24-hour format: "11:50"
  String to12HourTime() => DateFormat('hh:mm a')
      .format(this); // 12-hour format with AM/PM: "11:50 PM"

  String to12HourFullTime() => DateFormat('hh:mm:ss a')
      .format(this); // 12-hour format with seconds and AM/PM: "11:50:52 PM"

  String toFullDateTime() => DateFormat('EEEE, MMMM d, yyyy HH:mm:ss')
      .format(this); // Example output: "Saturday, June 20, 2020 00:00:00"

  String toShortDateTime() => DateFormat('MM/dd/yyyy HH:mm')
      .format(this); // Example output: "06/20/2020 00:00"

  String toFriendlyDateString() {
    if (isToday) return "Today";
    if (isYesterday) return "Yesterday";
    if (isThisWeek()) return "This week";
    if (isLastWeek()) return "Last week";
    if (isThisMonth()) return "This month";
    if (isLastMonth()) return "Last month";
    return toLongDate(); // Default output: returns formatted date
  }

  // Calculates the time elapsed since the date and returns a friendly string.
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays >= 7) return toFriendlyDateString();
    if (difference.inDays >= 1) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago'; // Example output: "3 days ago"
    }
    if (difference.inHours >= 1) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago'; // Example output: "5 hours ago"
    }
    if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago'; // Example output: "15 minutes ago"
    }
    return 'Just now'; // Example output: "Just now"
  }
}


// class Example extends StatefulWidget {
//   const Example({super.key});

//   @override
//   State<Example> createState() => _ExampleState();
// }

// class _ExampleState extends State<Example> {
//   DateTime dateTime = DateTime.now();
  
//   @override
//   Widget build(BuildContext context) {
//     debugPrint(dateTime.toFriendlyDateString());

//     return const Placeholder();
//   }
// }
