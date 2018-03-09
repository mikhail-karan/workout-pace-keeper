import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

AudioPlayer audioPlayer = new AudioPlayer();

const kUrl = 'assets/sounds/light.mp3';
String localfilepath;


loadFile() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = new File("${dir.path}/light.mp3");
  if(!(await file.exists())) {
      final soundData = await rootBundle.load(kUrl);
      final bytes = soundData.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
  }
  if (await file.exists()){
    localfilepath = file.path;
  }
  
  
}

playLocal() async {
  await audioPlayer.play(localfilepath,  isLocal: true);
}

