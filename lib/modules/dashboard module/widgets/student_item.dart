// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter_next/utils/shadows/next_shadow.dart';

// Project imports:
import '../../../core/proto_generated/students.pb.dart';
import '../../student details module/screens/student_details_view.dart';

class StudentItem extends StatelessWidget {
  final Student student;
  final Function refreshFunction;
  const StudentItem(
      {Key? key, required this.student, required this.refreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(builder: (context, isHovered) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            child: Hero(
              tag: "ProfilePic${student.id}",
              child: Image.asset(
                student.gender == "Female"
                    ? "assets/images/female.png"
                    : "assets/images/male.png",
                fit: BoxFit.contain,
              ),
            ).clipRRect(all: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            student.name,
            style: const TextStyle(
                fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
          ),
          Text(
            student.dept,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      )
          .pad(12)
          .container(
              animationDuration: const Duration(milliseconds: 600),
              shouldAnimate: true,
              decoration: BoxDecoration(
                  boxShadow: isHovered ? NextShadow.shadow400() : null,
                  color: context.scaffoldBackgroundColor,
                  border:
                      Border.all(color: const Color(0xFF55595c), width: 0.1)))
          .onTap(() async {
        await context.navigator.push(MaterialPageRoute(
            builder: (_) => StudentDetailsView(
                  student: student,
                )));
        refreshFunction();
      });
    });
  }
}
