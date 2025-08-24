import 'package:flutter/material.dart';

class JoinRoomWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  final void Function(String) onJoin;
  JoinRoomWidget({Key? key, required this.onJoin}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Room Code",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: ElevatedButton.icon(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  onJoin(_controller.text);
                }
              },
              icon: Icon(Icons.login),
              label: Text('Join'),
            ),
          ),
        ],
      ),
    );
  }
}
