import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) =>
            Container(
              color: Colors.green,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              ),),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _buildNoteContainer(int index) {
    return Container(
      color: index.isEven ? Colors.blue : Colors.grey,
      child: Center(
        child: Text(
          "$index",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
