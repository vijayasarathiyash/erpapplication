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
  final String employmentType;
  final bool status;

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
