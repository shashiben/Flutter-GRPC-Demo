// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_next/flutter_next.dart';

// Project imports:
import 'package:grpcassign/common%20widgets/dropdown.dart';
import 'package:grpcassign/common%20widgets/text_field.dart';

class AddStudentView extends HookWidget {
  const AddStudentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gender = useState<String?>(null);
    final error = useState<String?>(null);
    final idController = useTextEditingController();
    final nameController = useTextEditingController();
    final deptController = useTextEditingController();

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.primaryColor,
      ),
      body: SingleChildScrollView(
        child: NextContainer(
          padding:
              EdgeInsets.symmetric(horizontal: context.width < 576 ? 20 : 0),
          crossAxisAlignment: CrossAxisAlignment.start,
          decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
          children: [
            SizedBox(height: context.height * 0.06),
            TextButton(
              child: const Text(
                "Go Back",
                style: TextStyle(
                    color: Color(0xFF1a1a1a),
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {},
            ),
            SizedBox(height: context.height * 0.02),
            ConstrainedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Student".toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 1.3,
                        fontSize: context.height * 0.04,
                        color: const Color(0xFF1A1A1A),
                        fontWeight: FontWeight.bold,
                      ),
                    ).paddingSymmetric(horizontal: 0, vertical: 16),
                    NextAlert(
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      onClosedIconPressed: () => error.value = null,
                      visible: error.value != null,
                      borderRadius: BorderRadius.circular(2),
                      variant: NextVariant.danger,
                      child: Text(error.value ?? ""),
                    ).customPadding(bottom: 8),
                    CommonTextField(
                      title: "ID",
                      controller: idController,
                    ),
                    CommonTextField(
                      title: "Name",
                      controller: nameController,
                    ),
                    CommonTextField(
                      title: "Department",
                      controller: deptController,
                    ),
                    CommonDropdown<String>(
                        value: gender.value,
                        onChanged: (value) {
                          gender.value = value;
                        },
                        title: "Gender",
                        items: const ["Male", "Female", "Others"]),
                    NextButton(
                      borderRadius: BorderRadius.circular(2),
                      onPressed: () {
                        if (idController.text.trim().isEmpty) {
                          error.value = "Please enter id";
                        } else if (nameController.text.trim().isEmpty) {
                          error.value = "Please enter name";
                        } else if (deptController.text.trim().isEmpty) {
                          error.value = "Please enter dept";
                        } else if (gender.value == null) {
                          error.value = "Please choose gender";
                        } else {
                          error.value = null;
                        }
                      },
                      child: const Text(
                        "Add Student",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
              constraints: const BoxConstraints(maxWidth: 500),
            ).center(),
          ],
        ).center(),
      ),
    );
  }
}
