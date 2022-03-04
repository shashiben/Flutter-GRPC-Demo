// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_next/flutter_next.dart';

// Project imports:
import 'package:grpcassign/modules/add%20student%20module/screens/add_student_view.dart';
import '../../../core/proto_generated/students.pb.dart';
import '../../../core/services/student_repo.dart';

class StudentDetailsView extends HookWidget {
  final Student student;
  const StudentDetailsView({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return IgnorePointer(
      ignoring: isLoading.value,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: context.primaryColor,
        ),
        body: SingleChildScrollView(
          child: NextContainer(
            decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
            padding:
                EdgeInsets.symmetric(horizontal: context.width < 576 ? 20 : 0),
            children: [
              NextRow(
                children: [
                  NextCol(
                    sizes: "col-12 col-xl-5 col-lg-5 col-md-6 col-sm-12",
                    child: Hero(
                            tag: "ProfilePic${student.id}",
                            child: Image.asset(
                              student.gender == "Female"
                                  ? "assets/images/female.png"
                                  : "assets/images/male.png",
                              height: context.height * 0.7,
                            ))
                        .addDecoration(BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4)))
                        .center()
                        .container(
                          height: context.height - 80,
                        ),
                  ),
                  NextCol(
                      sizes: "col-12 col-xl-7 col-lg-7 col-md-6 col-sm-12",
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...{
                                "Name": student.name,
                                "Department": student.dept,
                                "Gender": student.gender
                              }
                                  .entries
                                  .map((e) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text("${e.key}:"),
                                              ),
                                              Expanded(
                                                child: Text(e.value),
                                              ),
                                            ],
                                          ).customPadding(
                                              left: 15, top: 8, bottom: 8),
                                          const Divider()
                                        ],
                                      ))
                                  .toList(),
                              NextButton(
                                      borderRadius: BorderRadius.circular(4),
                                      onPressed: () {
                                        context.navigator
                                            .push(MaterialPageRoute(
                                                builder: (_) => AddStudentView(
                                                      student: student,
                                                    )));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Update",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ).paddingSymmetric(
                                          horizontal: 12, vertical: 0))
                                  .paddingSymmetric(
                                      horizontal: 15, vertical: 0),
                              NextButton(
                                itemBuilder: (context, isHovered, color) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: isHovered
                                            ? Colors.white
                                            : Colors.red,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: isHovered
                                                ? Colors.white
                                                : Colors.red),
                                      ),
                                    ],
                                  )
                                      .paddingSymmetric(
                                          horizontal: 28, vertical: 12)
                                      .container(
                                          shouldAnimate: true,
                                          decoration: BoxDecoration(
                                              color: isHovered
                                                  ? Colors.red
                                                  : context
                                                      .scaffoldBackgroundColor,
                                              border: Border.all(
                                                  color: Colors.red)));
                                },
                                variant: NextButtonVariant.outlined,
                                borderRadius: BorderRadius.circular(4),
                                onPressed: () async {
                                  isLoading.value = true;
                                  await StudentRepo().deleteStudent(student.id);
                                  isLoading.value = false;
                                  Navigator.pop(context);
                                },
                              ).paddingSymmetric(horizontal: 15, vertical: 0),
                            ],
                          )
                              .addDecoration(BoxDecoration(
                                  color: context.scaffoldBackgroundColor,
                                  border: Border.all(
                                      color: const Color(0xFF55595c),
                                      width: 0.1)))
                              .customPadding(
                                  bottom: 20,
                                  top: context.isMobile
                                      ? 0
                                      : context.height * 0.1),
                        ),
                      ))
                ],
              ),
            ],
          ).center(),
        ),
      ),
    );
  }
}
