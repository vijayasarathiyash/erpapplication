import 'Employee.dart';

class LeaveRepository {
  /// Mock data (replace with API later)
  List<Leave> getAllLeaves() {
    return [
      Leave(
        id: 'l1',
        employeeId: 'e1',
        employeeName: 'Rahul Sharma',
        fromDate: DateTime(2026, 2, 5),
        toDate: DateTime(2026, 2, 7),
        leaveType: 'CL',
        reason: 'Personal work',
        status: 'Approved',
      ),
      Leave(
        id: 'l2',
        employeeId: 'e2',
        employeeName: 'Priya Patel',
        fromDate: DateTime(2026, 2, 6),
        toDate: DateTime(2026, 2, 6),
        leaveType: 'SL',
        reason: 'Fever',
        status: 'Approved',
      ),
    ];
  }

  List<Leave> getTodayLeaves() {
    final today = DateTime.now();

    return getAllLeaves().where((leave) {
      return today.isAfter(
        leave.fromDate.subtract(const Duration(days: 1)),
      ) &&
          today.isBefore(
            leave.toDate.add(const Duration(days: 1)),
          ) &&
          leave.status == 'Approved';
    }).toList();
  }
}
