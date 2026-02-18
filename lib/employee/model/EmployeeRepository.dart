import 'package:cloud_firestore/cloud_firestore.dart';
import 'EmployeeModel.dart';

class EmployeeRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addEmployee(EmployeeModel employee) async {
    await _firestore
        .collection('employees')
        .doc(employee.id)
        .set(employee.toMap());
  }

  Future<List<EmployeeModel>> fetchEmployees() async {
    final snapshot = await _firestore
        .collection('employees')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => EmployeeModel.fromMap(doc.data()))
        .toList();
  }
}

