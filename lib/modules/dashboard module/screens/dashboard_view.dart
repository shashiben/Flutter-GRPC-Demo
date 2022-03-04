// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:grpcassign/core/services/student_repo.dart';
import 'package:grpcassign/modules/add%20student%20module/screens/add_student_view.dart';
import 'package:grpcassign/modules/dashboard%20module/widgets/student_item.dart';

import '../../../core/proto_generated/students.pb.dart';

class DashboardView extends HookWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFetched = useState(false);
    final error = useState<String?>(null);
    final studentsList = useState<List<Student>>(<Student>[]);
    useEffect(() {
      if (!isFetched.value) {
        StudentRepo().getStudentList().then((value) {
          isFetched.value = true;
          if (value is List) {
            studentsList.value = value as List<Student>;
          } else if (value is String) {
            error.value = value;
          }
        });
      }
      return;
    }, [isFetched.value]);
    return Scaffold(
      body: SingleChildScrollView(
        child: NextContainer(
          decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.height * 0.06),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Students".toUpperCase(),
                style: TextStyle(
                  letterSpacing: 4,
                  fontSize: context.height * 0.04,
                  color: const Color(0xFF1A1A1A),
                  fontWeight: FontWeight.bold,
                ),
              ).paddingSymmetric(horizontal: 0, vertical: 16),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: !isFetched.value
                  ? CircularProgressIndicator(
                      color: context.primaryColor,
                    ).center()
                  : const SizedBox(),
            ),
            NextAlert(
              variant: NextVariant.danger,
              visible: error.value != null,
              onClosedIconPressed: () {
                error.value = null;
              },
              child: Text(error.value ?? ""),
            ),
            NextRow(
                horizontalSpacing: 30,
                children: List.generate(
                    studentsList.value.length,
                    (index) => NextCol(
                        sizes:
                            "col-12 col-xl-3 col-lg-3 col-md-4 col-sm-6 col-xs-12",
                        child: StudentItem(
                          refreshFunction: () {
                            isFetched.value = false;
                          },
                          student: studentsList.value.elementAt(index),
                        ))).toList()),
            const SizedBox(
              height: 30,
            )
          ],
          padding:
              EdgeInsets.symmetric(horizontal: context.width < 576 ? 20 : 0),
        ).center(),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: const Text("NSD Solutions"),
        backgroundColor: context.primaryColor,
        actions: [
          Tooltip(
            message: context.width < 576 ? "Add new student" : "",
            child: TextButton.icon(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: context.width < 576
                  ? const SizedBox()
                  : const Text(
                      "Add student",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddStudentView()));
                isFetched.value = false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
