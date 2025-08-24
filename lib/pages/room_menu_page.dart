import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/room_menu_screen.dart';
import 'package:flutter_application_1/pages/room_screen.dart';

enum RoomMenuState { roomMenu, inRoomHost, inRoomGuest, playing }

class RoomMenuPage extends StatefulWidget {
  const RoomMenuPage({super.key});

  @override
  State<RoomMenuPage> createState() => _RoomMenuPageState();
}

class _RoomMenuPageState extends State<RoomMenuPage> {
  String? joinedRoom;
  RoomMenuState currentState = RoomMenuState.roomMenu;

  void _onJoinRoom(BuildContext context, String roomCode, String username) {
    setState(() {
      joinedRoom = roomCode;
      currentState = RoomMenuState.inRoomGuest;
    });
  }

  void _onCreateRoom(BuildContext context) {
    setState(() {
      joinedRoom = "CreatedRoom123"; // Replace with actual room code
      currentState = RoomMenuState.inRoomHost;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (currentState) {
      case RoomMenuState.roomMenu:
        screen = RoomMenuScreen(
          username: "User",
          onJoin: (roomCode, username) =>
              _onJoinRoom(context, roomCode, username),
          onCreate: (roomCode) => _onCreateRoom(context),
        ); // Replace with actual username
      case RoomMenuState.inRoomHost:
        screen = RoomScreen(roomCode: joinedRoom!, isHost: true);
      case RoomMenuState.inRoomGuest:
        screen = RoomScreen(roomCode: joinedRoom!, isHost: false);
      case RoomMenuState.playing:
        screen = Center(
          child: Text("Game in progress"),
        ); // Placeholder for game screen
    }
    return screen;
  }
}
