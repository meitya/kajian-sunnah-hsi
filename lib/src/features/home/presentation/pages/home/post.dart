import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_state.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/widgets/post_tile.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10.withOpacity(0),
      width: 200,
      height: 280,
      margin: const EdgeInsets.fromLTRB(16, 12, 0, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 24.0, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue,
            width: 2,
            height: 22,
            margin: const EdgeInsets.only(right: 4),
          ),
          const Text(
            'Agenda',
            style: TextStyle(
              fontFamily: 'Butler',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const Spacer(flex: 2),
          Text(
            'Lihat semua >',
            style: TextStyle(
              fontFamily: 'Butler',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.indigo[700],
            ),
          ),
        ],
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemotePostsBloc, RemotePostsState>(
      builder: (context, state) {
        if (state is RemotePostsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RemotePostsDone) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                final post = state.posts![index];
                return PostWidget(post: post);
              },
            ),
          );
        }

        if (state is RemotePostsError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }

        return const SizedBox();
      },
    );
  }
}
