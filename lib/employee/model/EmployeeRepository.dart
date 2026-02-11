import 'Employee.dart';

class EmployeeRepository {
  List<Employee> fetchEmployees() {
    return [
      Employee(
        id: 'EMP001',
        name: 'Omkar Shinde',
        email: 'omkar.shinde@company.com',
        phone: '9876543210',
        address: 'Pune, Maharashtra',

        department: 'Engineering',
        designation: 'Senior Android Developer',
        managerId: 'EMP100',
        managerName: 'Rahul Patil',

        joiningDate: DateTime(2021, 3, 15),
        employmentType: 'Full-time',
        status: 'Active',

        skills: ['Kotlin', 'Jetpack Compose', 'Flutter', 'Bloc'],
        experience: 6,
        isOnLeave: false,
      ),

      Employee(
        id: 'EMP002',
        name: 'Rahul Patil',
        email: 'rahul.patil@company.com',
        phone: '9822334455',
        address: 'Mumbai, Maharashtra',

        department: 'Engineering',
        designation: 'Engineering Manager',
        managerId: 'EMP101',
        managerName: 'Sneha Kulkarni',

        joiningDate: DateTime(2019, 7, 10),
        employmentType: 'Full-time',
        status: 'Active',

        skills: ['Team Management', 'Architecture', 'Flutter'],
        experience: 10,
        isOnLeave: true,
      ),

      Employee(
        id: 'EMP003',
        name: 'Sneha Kulkarni',
        email: 'sneha.kulkarni@company.com',
        phone: '9011223344',
        address: 'Bangalore, Karnataka',

        department: 'HR',
        designation: 'HR Manager',
        managerId: 'EMP000',
        managerName: 'CEO',

        joiningDate: DateTime(2018, 1, 5),
        employmentType: 'Full-time',
        status: 'Active',

        skills: ['Recruitment', 'Employee Engagement', 'HR Policies'],
        experience: 12,
        isOnLeave: false,
      ),

      Employee(
        id: 'EMP004',
        name: 'Amit Verma',
        email: 'amit.verma@company.com',
        phone: '8899776655',
        address: 'Delhi, India',

        department: 'Design',
        designation: 'UI/UX Designer',
        managerId: 'EMP002',
        managerName: 'Rahul Patil',

        joiningDate: DateTime(2022, 6, 1),
        employmentType: 'Contract',
        status: 'Active',

        skills: ['Figma', 'Design Systems', 'UX Research'],
        experience: 4,
        isOnLeave: true,
      ),
    ];
  }
}
