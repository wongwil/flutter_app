import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/favorites_page.dart';
import 'package:flutter_application_1/pages/generator_page.dart';
import 'package:flutter_application_1/pages/room_menu_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var showNavigationRail = false;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = RoomMenuPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  showNavigationRail = !showNavigationRail;
                });
              },
            ),
          ),
          body: Row(
            children: [
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: showNavigationRail
                    ? SafeArea(
                        child: NavigationRail(
                          extended: constraints.maxWidth >= 600,
                          destinations: [
                            NavigationRailDestination(
                              icon: Icon(Icons.home),
                              label: Text('Home'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.favorite),
                              label: Text('Favorites'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.meeting_room),
                              label: Text('Room'),
                            ),
                          ],
                          selectedIndex: selectedIndex,
                          onDestinationSelected: (value) {
                            setState(() {
                              selectedIndex = value;
                            });
                          },
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
