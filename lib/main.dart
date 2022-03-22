import 'package:flutter/material.dart';
import 'package:music_player_app/ass_audiop.dart';
import 'package:music_player_app/play_file.dart';
import 'package:music_player_app/play_music.dart';
import 'package:music_player_app/play_network.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MusicApp()
     // PlayFromNetwork()
      //AssetAudio()
     // PlayMusic(),
    );
  }
}
class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List<Widget> myWidget=[PlayMusic(), PlayFromNetwork(), PlayLocalFile()];
  int pageIndex= 0;
  selectPage(int val)
  {
    setState(() {
      pageIndex=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidget[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Assets'),
          BottomNavigationBarItem(icon:Icon( Icons.vpn_lock),label: 'Network'),
          BottomNavigationBarItem(icon: Icon(Icons.folder),label: 'File')
        ],
      ),
    );
  }
}

