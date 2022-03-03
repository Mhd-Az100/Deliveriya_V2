import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../view_model/statuses_view_model.dart';

class Statuses extends StatelessWidget {
  var story = Get.find<StatusesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          var indexstory = 0.obs;
          return story.statusItems.isNotEmpty
              ? Dismissible(
                  key: const Key('key'),
                  direction: DismissDirection.vertical,
                  onDismissed: (_) {
                    Get.back();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 490.h,
                        color: Colors.red,
                        width: double.infinity,
                        child: StoryView(
                          onStoryShow: (items) {
                            indexstory.value = story.statusItems.indexOf(items);
                            story.checkIdStory(int.parse(
                                '${story.story![indexstory.value].id}'));
                          },
                          onComplete: () {
                            story.viewStory.value = false;
                            Get.back();
                          },
                          storyItems: story.statusItems,
                          controller: story.controller,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20.h, bottom: 32.h, right: 35.w, left: 35.w),
                        height: 210.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              topLeft: Radius.circular(10.r),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Story Title :',
                              style: text18600txtcolor,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Obx(() {
                              return Text(
                                '${story.story![indexstory.value].id}',
                                style: text16400descgrey,
                              );
                            }),
                            SizedBox(
                              height: 45.h,
                            ),
                            Bottun(
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                txt: 'Add to cart',
                                background: orangeColor,
                                onpressed: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
        }),
      ),
      // Material(
      //   child: InkWell(
      //     onTap: () {
      //       Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) => MoreStories()));
      //     },
      //     child: Container(
      //       decoration: BoxDecoration(
      //           color: Colors.black54,
      //           borderRadius:
      //               BorderRadius.vertical(bottom: Radius.circular(8))),
      //       padding: EdgeInsets.symmetric(vertical: 8),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Icon(
      //             Icons.arrow_forward,
      //             color: Colors.white,
      //           ),
      //           SizedBox(
      //             width: 16,
      //           ),
      //           Text(
      //             "View more stories",
      //             style: TextStyle(fontSize: 16, color: Colors.white),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
