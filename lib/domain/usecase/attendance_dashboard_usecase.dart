import 'package:intl/intl.dart';

import '../../data/model/attendance_time_model.dart';

class AttendanceTimeUseCase {
  AttendanceTimeModel execute() {
    return executeFrom(DateTime.now());
  }

  AttendanceTimeModel executeFrom(DateTime dateTime) {
    return AttendanceTimeModel(
      time: DateFormat('hh:mm a').format(dateTime),
      date: DateFormat('EEEE, MMMM d, yyyy').format(dateTime),
    );
  }
}
