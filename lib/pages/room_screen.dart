import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final String roomCode;
  final bool isHost;

  const RoomScreen({required this.roomCode, required this.isHost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Text(
          isHost
              ? "You created this room $roomCode!"
              : "You joined room $roomCode",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
