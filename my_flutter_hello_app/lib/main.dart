import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/medias': (context) => MediasPage(),
        '/favorits': (context) => FavoritsPage(),
      },
    );
  }
}
class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Navbar'),
        actions: <Widget>[
          TextButton(
            onPressed: () { Navigator.pushNamed(context, '/home');},
            child: Container(
              child: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
           TextButton(
            onPressed: () { Navigator.pushNamed(context, '/medias');},
            child: Container(
              child: const Text(
                'Medias',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () { Navigator.pushNamed(context, '/favorits');},
            child: Container(
              child: const Text(
                'Favorits',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
        ],
      ),
      );
     
}  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}


class MediasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: Text('Medias Page'),
      ),
    );
  }
}

class FavoritsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(),
      body: Center(
        child: Text('Favories Page'),
      ),
    );
  }
}
