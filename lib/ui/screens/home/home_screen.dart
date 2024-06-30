import 'package:flutter/material.dart';
import '../../utils/my_drawer.dart';
import 'movies_list/movies.dart';


class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            leading: Builder(
              builder: (context) {
                return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              },
            ),
            bottom: const TabBar(
              tabs: [
                Text("Popular"),
                Text("Top Rated"),
                Text("Favourite"),
              ],
              dividerColor: Colors.grey,
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              automaticIndicatorColorAdjustment: true,
              padding: EdgeInsets.fromLTRB(
                0,
                8,
                0,
                0,
              ),
              labelPadding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              enableFeedback: true,
            ),
            title: const Text(
              "Movies App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          drawer: const MyDrawer(),
          body: const TabBarView(children: [
            Center(
              child: MoviesList(
                type: "popular",
              ),
            ),
            Center(
              child: MoviesList(
                type: "top_rated",
              ),
            ),
            Center(
              child: Text("Soon.."),
            ),
          ]),
        ));
  }
}




