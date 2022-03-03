import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/story_model.dart';
import 'package:dilivirya/services/home_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StatusesController extends GetxController with BaseController {
  // HomeService homeService = HomeService();
  final StoryController controller = StoryController();
  var statusItems = <StoryItem>[].obs;
  List<ResponseStory>? story;
  var viewStory = true.obs;

  @override
  void onInit() async {
    // await getstory();
    checkviewstory();
    super.onInit();
  }

  // getstory() async {
  //   story = await homeService.getData();
  //   if (story != null) {
  //     mediastatuse(story);
  //   }
  // }

  MediaType _translateType(String? type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  mediastatuse(var statuse) {
    final res = statuse.map<Story>((it) {
      return Story(media: it.media, mediaType: _translateType(it.mediaType));
    }).toList();
    res!.forEach((story) {
      if (story.mediaType == MediaType.text) {
        statusItems.add(
          StoryItem.text(
            title: story.caption!,
            backgroundColor: Colors.red,
            duration: Duration(
              milliseconds: (5 * 1000).toInt(),
            ),
          ),
        );
      }
      if (story.mediaType == MediaType.image) {
        statusItems.add(StoryItem.pageImage(
          url: urlimage + story.media!,
          controller: controller,
          // caption: story.caption,
          duration: Duration(
            milliseconds: (5 * 1000).toInt(),
          ),
        ));
      }
      if (story.mediaType == MediaType.video) {
        statusItems.add(
          StoryItem.pageVideo(
            urlimage + story.media!,
            controller: controller,
            duration: Duration(milliseconds: (5 * 1000).toInt()),
          ),
        );
      }
    });
  }

  checkIdStory(int id) async {
    var storyIdstorage = await box.read('storyId');
    List storyId = [];
    storyId.forEach((element) {
      storyId.add(element);
    });
    var checkId = true;
    storyId.forEach((element) {
      if (element == id) {
        checkId = false;
      } else {
        checkId = true;
      }
    });
    if (checkId) {
      storyId.add(id);
      await box.write('storyId', storyId);
    }
  }

  checkviewstory() async {
    var storyIdstorage = await box.read('storyId');
    List storyId = [];
    storyId.forEach((element) {
      storyId.add(element);
    });
    for (int i = 0; i < story!.length; i++) {
      for (int j = 0; j < storyId.length; j++) {
        if (story![i].id != storyId[j]) {
          viewStory.value = false;
        }
      }
    }
  }
}

enum MediaType { image, video, text }

class Story {
  final MediaType? mediaType;
  final String? media;

  Story({
    this.mediaType,
    this.media,
  });
}
