import 'package:flutter/material.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/pages/home/post.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildAppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.grid_view,
          color: Colors.black.withOpacity(0.7),
        ),
        tooltip: 'Show Snackbar',
        onPressed: () {},
      ),
      title: const Text(
        'Kajian Sunnah',
        style: TextStyle(
          fontFamily: 'Butler',
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: Colors.black87,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.indigo.shade200.withOpacity(0.2)],
          stops: const [
            0.1,
            1,
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          Post(),
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      color: Colors.indigo.shade200.withOpacity(0.2),
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BottomAppBar(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  tooltip: 'Show Snackbar',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.collections_bookmark_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  tooltip: 'Show Snackbar',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.school_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  tooltip: 'Show Snackbar',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  tooltip: 'Show Snackbar',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  tooltip: 'Show Snackbar',
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}
