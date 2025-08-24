import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/join_room.dart';

class RoomMenuScreen extends StatelessWidget {
  final String username;
  final void Function(String roomCode, String username) onJoin;
  final void Function(String roomCode) onCreate;
  const RoomMenuScreen({
    required this.username,
    required this.onJoin,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          JoinRoomWidget(onJoin: (roomCode) => onJoin(roomCode, username)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.create),
              label: Text('Create a new room'),
              onPressed: () {
                onCreate(username);
              },
            ),
          ),
        ],
      ),
    );
  }
}
