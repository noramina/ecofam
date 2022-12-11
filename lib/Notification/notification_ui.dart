import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NotifScreen extends StatelessWidget {
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 248, 248),
          title: const Text("Notification"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 91, 31),
              fontSize: 17,
              fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 8, left: 10),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 91, 31),
                          fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '5h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '6h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 0.5,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: const Text(
                      'Yesterday',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 91, 31),
                          fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '5h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '6h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 0.5,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: const Text(
                      'Last Week',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 91, 31),
                          fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '5h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '6h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 0.5,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: const Text(
                      'Last Month',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 91, 31),
                          fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '5h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                  const ListTile(
                    leading: FittedBox(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/117661473?s=96&v=4'),
                    )),
                    title: Text(
                      'Nora Mina. Asisnan Medan, and 7 orthers commented your post',
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'Plus Jakarta Sans'),
                    ),
                    subtitle: Text(
                      '6h',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Plus Jakarta Sans'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
