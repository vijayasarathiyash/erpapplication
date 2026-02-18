import 'package:erpapplication/employee/model/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../employee/controller/EmployeeBloc.dart';
import '../../../employee/model/SearchEmployee.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final departmentController = TextEditingController();
  final designationController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();
  final addressController = TextEditingController();

  bool isActive = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    departmentController.dispose();
    designationController.dispose();
    experienceController.dispose();
    skillsController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _inputField('Name', nameController),
              _inputField(
                'Email',
                emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              _inputField(
                'Phone',
                phoneController,
                keyboardType: TextInputType.phone,
              ),
              _inputField('Department', departmentController),
              _inputField('Designation', designationController),
              _inputField(
                'Experience (Years)',
                experienceController,
                keyboardType: TextInputType.number,
              ),
              _inputField(
                'Skills (comma separated)',
                skillsController,
                hint: 'Kotlin, Flutter, Bloc',
              ),
              _statusDropdown(),
              _inputField('Address', addressController, maxLines: 3),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Save Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
        int maxLines = 1,
        String? hint,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _statusDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<bool>(
        value: isActive,
        items: const [
          DropdownMenuItem(value: true, child: Text('Active')),
          DropdownMenuItem(value: false, child: Text('Inactive')),
        ],
        onChanged: (value) {
          setState(() {
            isActive = value!;
          });
        },
        decoration: InputDecoration(
          labelText: 'Status',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final empId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      final employee = EmployeeModel(
        id: empId,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
        department: departmentController.text.trim(),
        designation: designationController.text.trim(),
        managerId: 'EMP100',
        managerName: 'Tarun Seera',
        joiningDate: DateTime.now(),
        employmentType: 'Full-time',
        status: isActive ? 'Active' : 'Inactive',
        skills: skillsController.text
            .split(',')
            .map((e) => e.trim())
            .toList(),
        experience: int.parse(experienceController.text),
        isOnLeave: false,
      );

      context.read<EmployeeBloc>().add(AddEmployee(employee));
      Navigator.pop(context);
    }
  }
}
