import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_screen/component/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPuckPlayScreen extends StatefulWidget {
  const VideoPuckPlayScreen({super.key});

  @override
  State<VideoPuckPlayScreen> createState() => _VideoPuckPlayScreeState();
}

class _VideoPuckPlayScreeState extends State<VideoPuckPlayScreen> {
  XFile? _pickedFile;
  final ImagePicker picker = ImagePicker();

  VideoPlayerController? _controller;
  Future<void>? _video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap.v(50),
            if (_controller != null)
              Stack(
                children: [
                  FutureBuilder(
                    future: _video,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Center(
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: _playPausePress,
                      child: Icon(_controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow))
                ],
              ),
            const Gap.v(30),
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text("Pick video"),
            ),
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
    _pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (_pickedFile == null) {
      return;
    }
    _controller = VideoPlayerController.file(File(_pickedFile?.path ?? ''));
    _video = _controller!.initialize();
    setState(() {});
  }

  void _playPausePress() async {
    if (_controller!.value.isPlaying) {
      setState(() {
        _controller!.pause();
      });
    } else {
      setState(() {
        _controller!.play();
      });
    }
  }
}