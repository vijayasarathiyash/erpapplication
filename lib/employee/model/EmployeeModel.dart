import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
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
  final String status;

  final List<String> skills;
  final int experience;

  final bool isOnLeave;

  EmployeeModel({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'department': department,
      'designation': designation,
      'managerId': managerId,
      'managerName': managerName,
      'joiningDate': Timestamp.fromDate(joiningDate),
      'employmentType': employmentType,
      'status': status,
      'skills': skills,
      'experience': experience,
      'isOnLeave': isOnLeave,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      department: map['department'],
      designation: map['designation'],
      managerId: map['managerId'],
      managerName: map['managerName'],
      joiningDate: (map['joiningDate'] as Timestamp).toDate(),
      employmentType: map['employmentType'],
      status: map['status'],
      skills: List<String>.from(map['skills']),
      experience: map['experience'],
      isOnLeave: map['isOnLeave'],
    );
  }
}
class Leave {
  final String id;
  final String employeeId;
  final String employeeName;

  final DateTime fromDate;
  final DateTime toDate;
  final String leaveType;
  final String reason;

  final String status;

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

  int get totalDays => toDate.difference(fromDate).inDays + 1;
}
