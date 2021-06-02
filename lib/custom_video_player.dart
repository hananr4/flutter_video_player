import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const CustomVideoPlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  int duracion = 0;
  bool startPlaying = false;
  @override
  Widget build(BuildContext context) {
    // widget.controller.addListener(() {
    //   getPosicion();
    // });

    widget.controller.addListener(() {
      if (startPlaying && widget.controller.value.isPlaying) {
        //widget.controller.position.then((value) => duracion = value!.inSeconds);
        //print('aqui');
      }
    });

    return Column(
      children: [
        widget.controller.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                ),
              )
            : Container(
                child: Text('Cargando'),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                widget.controller.seekTo(Duration(seconds: 0));
              },
              icon: Icon(Icons.first_page, size: 50),
            ),
            IconButton(
              onPressed: () {
                if (startPlaying)
                  widget.controller.pause();
                else
                  widget.controller.play();
                setState(() {
                  startPlaying = !startPlaying;
                });
              },
              icon: Icon((startPlaying) ? Icons.pause : Icons.play_arrow,
                  size: 50),
            ),
            IconButton(
              onPressed: () {
                widget.controller.seekTo(Duration(seconds: 1000000));
              },
              icon: Icon(Icons.last_page, size: 50),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        VideoProgressIndicator(
          widget.controller,
          allowScrubbing: true,
        ),
      ],
    );
  }

  Future<void> getPosicion() async {
    var posicion = await widget.controller.position;
    if (posicion != null) {
      setState(() {
        duracion = posicion.inSeconds;
      });
    }
  }
}
