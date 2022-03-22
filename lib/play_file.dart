import 'dart:io';
import 'package:http/http.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class PlayLocalFile extends StatefulWidget {
  const PlayLocalFile({Key? key}) : super(key: key);

  @override
  _PlayLocalFileState createState() => _PlayLocalFileState();
}

class _PlayLocalFileState extends State<PlayLocalFile> {
  AudioPlayer filePlayer = AudioPlayer();
  String file = 'file';
  AudioCache cache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 179, 185, 1),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Pick an Audio file',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          InkWell(
              onTap: () async {
               // await _loadFile();
                final result = await openFile();
                if (result != null) {
                  await cache.play(result.toString());
                  //await filePlayer.play(result, isLocal: true);
                } else {
                  return null;
                }
              },
              child: Icon(
                Icons.folder_open,
                size: 50,
              )),
          Text('${file.toString()}'),
        ],
      ),
    );
  }

  openFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio, allowMultiple: false);
    if (result != null) {
      setState(() {
        file = result.files.single.path.toString();
      });
      print("${result.files.single.path.toString()}");
      return File(result.files.single.path.toString());
    }
    return null;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    filePlayer.dispose();
  }

// String? localFilePath;
//   String  Url = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
//   Future _loadFile() async {
//     final bytes = await readBytes(Uri.parse(Url));
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/audio.mp3');
//
//     await file.writeAsBytes(bytes);
//     if (file.existsSync()) {
//       setState(() => localFilePath = file.path);
//     }
//     print("${file.path.toString()}");
//   }
}
