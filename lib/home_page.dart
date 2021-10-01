import 'package:flutter/material.dart';

import 'package:video_prueba/download_file.dart';

import 'custom_video_player.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? file;

  @override
  Widget build(BuildContext context) {
    // final controller = VideoPlayerController.network(
    //     'https://www.greensoft.com.ec/wp-content/uploads/2014/12/Administraci%C3%B3nProyectos.mp4');

    return Scaffold(
      appBar: AppBar(
        title: Text('Video assets'),
      ),
      body: ListView(
        children: [
          CustomVideoPlayer(
              type: TypeVideoDatasource.network,
              datasource:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
          CustomVideoPlayer(
            type: TypeVideoDatasource.asset,
            datasource: 'assets/video_local.mp4',
          ),
          if (file != null)
            CustomVideoPlayer(
              type: TypeVideoDatasource.file,
              datasource: this.file!,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final helper = DownloadHelper();
            helper
                .downloadVideo(
                    'https://media.istockphoto.com/videos/abstract-background-with-3d-rings-and-rotating-parts-clean-and-modern-video-id1248225100',
                    'ejemplo1')
                .then((value) => this.setState(() {
                      this.file = value;
                    }));
          },
          child: Icon(Icons.download)),
    );
  }
}
