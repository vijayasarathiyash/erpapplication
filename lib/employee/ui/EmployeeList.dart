import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/EmployeeBloc.dart';
import '../model/EmployeeState.dart';
import 'EmployeeDetailPage.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is EmployeeLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: state.employees.length,
            itemBuilder: (context, index) {
              final e = state.employees[index];

              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      e.name[0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(e.name),
                  subtitle:
                  Text('${e.designation} • ${e.department}'),
                  trailing: e.isOnLeave
                      ? const Icon(Icons.beach_access,
                      color: Colors.orange)
                      : null,

                  /// 👉 Navigation added here
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EmployeeDetailPage(employee: e),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
