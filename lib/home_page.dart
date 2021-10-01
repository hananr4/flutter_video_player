import 'package:flutter/material.dart';

import 'custom_video_player.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = VideoPlayerController.network(
    //     'https://www.greensoft.com.ec/wp-content/uploads/2014/12/Administraci%C3%B3nProyectos.mp4');

    return Scaffold(
      appBar: AppBar(
        title: Text('Video assets'),
      ),
      body: ListView(children: [
        CustomVideoPlayer(),
        // CustomVideoPlayer(),
        // CustomVideoPlayer(),
        // CustomVideoPlayer(),
        // CustomVideoPlayer(),
      ]),
    );
  }
}
