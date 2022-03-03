// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter_next/utils/shadows/next_shadow.dart';
import 'package:grpcassign/modules/add%20student%20module/screens/add_student_view.dart';
import 'package:grpcassign/modules/student%20details%20module/screens/student_details_view.dart';

class DashboardView extends HookWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            NextRow(
                horizontalSpacing: 30,
                children: List.generate(
                    10,
                    (index) => NextCol(
                          sizes:
                              "col-12 col-xl-3 col-lg-3 col-md-4 col-sm-6 col-xs-12",
                          child: HoverWidget(builder: (context, isHovered) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  child: Hero(
                                    tag: "ProfilePic$index",
                                    child: Image.asset(
                                      index % 3 == 0
                                          ? "assets/images/female.png"
                                          : "assets/images/male.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ).clipRRect(all: 8),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  "Shashi Kumar",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "B.Tech",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                                .pad(12)
                                .container(
                                    animationDuration:
                                        const Duration(milliseconds: 600),
                                    shouldAnimate: true,
                                    decoration: BoxDecoration(
                                        boxShadow: isHovered
                                            ? NextShadow.shadow400()
                                            : null,
                                        color: context.scaffoldBackgroundColor,
                                        border: Border.all(
                                            color: const Color(0xFF55595c),
                                            width: 0.1)))
                                .onTap(() {
                              context.navigator.push(MaterialPageRoute(
                                  builder: (_) => const StudentDetailsView()));
                            });
                          }),
                        )).toList()),
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddStudentView()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
