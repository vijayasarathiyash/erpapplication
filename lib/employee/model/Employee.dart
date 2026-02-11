class Employee {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;

  final String department;
  final String designation;
  final String managerId;
  final String managerName;

  final DateTime joiningDate;
  final String employmentType; // Full-time / Contract
  final String status; // Active / Resigned / On Hold

  final List<String> skills;
  final int experience; // years

  final bool isOnLeave;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.department,
    required this.designation,
    required this.managerId,
    required this.managerName,
    required this.joiningDate,
    required this.employmentType,
    required this.status,
    required this.skills,
    required this.experience,
    required this.isOnLeave,
  });
}


class Leave {
  final String id;
  final String employeeId;
  final String employeeName;

  final DateTime fromDate;
  final DateTime toDate;
  final String leaveType; // CL, SL, PL, WFH
  final String reason;

  final String status; // Approved / Pending / Rejected

  Leave({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.fromDate,
    required this.toDate,
    required this.leaveType,
    required this.reason,
    required this.status,
  });

  int get totalDays =>
      toDate.difference(fromDate).inDays + 1;
}

