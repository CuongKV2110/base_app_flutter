import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:base_app/page/detail_course_page/detail_course_page.dart';
import 'package:base_app/page/edit_course_page/edit_course_page.dart';
import 'package:base_app/widget/app_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CourseItemWidget extends StatelessWidget {
  final CourseDto courseDto;
  const CourseItemWidget({
    Key? key,
    required this.courseDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: CachedNetworkImage(
                imageUrl: courseDto.image,
                fit: BoxFit.fill,
                placeholder: (context, url) => const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white70),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseDto.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        hSpaceItem1,
                        Text(
                          courseDto.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        backgroundColor: Colors.blue,
                        title: 'Chi tiết',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return DetailCoursePage(
                                id: courseDto.id,
                              );
                            }),
                          );
                        },
                        titleStyle: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppButton(
                        backgroundColor: Colors.blue,
                        title: 'Sửa',
                        titleStyle: const TextStyle(fontSize: 12),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return EditCoursePage(
                                courseDto: courseDto,
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
