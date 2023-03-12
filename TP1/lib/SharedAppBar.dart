import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              child: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/medias');
            },
            child: Container(
              child: const Text(
                'Medias',
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorits');
            },
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
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}