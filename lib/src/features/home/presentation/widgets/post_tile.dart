import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kajian_sunnah_hsi/src/core/widgets.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/post_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostWidget extends StatelessWidget {
  final PostEntity? post;

  const PostWidget({super.key, this.post});

  static const imageHeight = 125.0;
  static const canvasHeight = 280.0;
  static const canvasWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 12, 4),
      alignment: Alignment.center,
      width: canvasWidth,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Flexible(flex: 1, child: _buildTitleAndDescription(context)),

          Flexible(
              flex: 1,
              child: post!.imageURL.isNotEmpty
                  ? _buildImage(context)
                  : _buildImagePlaceholder(context)),
          // _buildTitleAndDescription(),
        ],
      ),
    );
  }

  _buildImagePlaceholder(BuildContext context) {
    return buildImagePlaceholder(
        width: MediaQuery.of(context).size.width, height: imageHeight);
  }

  _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: post!.imageURL,
      imageBuilder: (context, imageProvider) =>
          //  Padding(
          //   padding: const EdgeInsetsDirectional.only(end: 14),
          //   child:
          ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: imageHeight,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        ),
        // ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const CupertinoActivityIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  _buildTitleAndDescription(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: canvasHeight,
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 4),
            // Title

            Text(
              post!.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  post!.slug,
                  maxLines: 3,
                  style: const TextStyle(
                    fontFamily: 'Butler',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            Row(
              children: [
                // Like count
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _buildIconAndValue(
                      const Icon(Icons.thumb_up_alt_outlined, size: 14),
                      post!.likeCount),
                ),

                // View count
                _buildIconAndValue(
                    const Icon(Icons.visibility, size: 14), post!.viewCount),

                const Spacer(),

                // Bookmark
                _buildIconAndValue(
                    const Icon(Icons.bookmark_add_outlined, size: 14),
                    post!.bookmarkCount),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildIconAndValue(Icon icon, String value) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
