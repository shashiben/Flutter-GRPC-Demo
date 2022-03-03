import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          tag: "ProfilePic2",
                          child: Image.asset(
                            "assets/images/male.png",
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
                            const ListTile(
                              dense: true,
                              leading: Text("Name:"),
                              horizontalTitleGap: 40,
                              title: Text("Shashi Kumar"),
                            ),
                            const Divider(),
                            const ListTile(
                              dense: true,
                              leading: Text("Department:"),
                              horizontalTitleGap: 40,
                              title: Text("Shashi Kumar"),
                            ),
                            const Divider(),
                            const ListTile(
                              dense: true,
                              leading: Text("Gender:"),
                              horizontalTitleGap: 40,
                              title: Text("Shashi Kumar"),
                            ),
                            const Divider(),
                            NextButton(
                                    borderRadius: BorderRadius.circular(4),
                                    onPressed: () {},
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ).paddingSymmetric(
                                        horizontal: 12, vertical: 0))
                                .paddingSymmetric(horizontal: 15, vertical: 0),
                            NextButton(
                              itemBuilder: (context, isHovered, color) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color:
                                          isHovered ? Colors.white : Colors.red,
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
                                            border:
                                                Border.all(color: Colors.red)));
                              },
                              variant: NextButtonVariant.outlined,
                              borderRadius: BorderRadius.circular(4),
                              onPressed: () {},
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
    );
  }
}
