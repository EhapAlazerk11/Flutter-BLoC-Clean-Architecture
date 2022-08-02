import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';
import 'full_image.dart';

class DiffImage extends StatelessWidget {
  final dynamic image;
  final dynamic height;
  final dynamic width;
  final dynamic onClick;
  final dynamic fitType;
  final dynamic raduis;
  final bool isExpand;
  final Function? onUserTap;

  const DiffImage(
      {Key? key,
        this.image,
        this.height,
        this.width,
        this.raduis = 5.0,
        this.isExpand = true,
        this.onClick = true,
        this.onUserTap,
        this.fitType = BoxFit.fill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.primaryColor;
    return InkWell(
      onTap: onClick == true
          ? () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FullPhoto(
            images: [image],
            index: 0,
          ),
        ),
      )
          : () => onUserTap!(),
      child: image is String
          ? Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raduis),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(raduis),
              child: CachedNetworkImage(
                placeholder: (context, url) => Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                imageUrl: image,
                fit: fitType,
                errorWidget: (_, url, error) => Container(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          // width > 70.0 && isExpand
          //     ? Positioned(
          //         top: 8.0,
          //         right: 8.0,
          //         child: Container(
          //           width: 35,
          //           height: 35,
          //           padding: EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             color: Colors.black.withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(10.0),
          //           ),
          //           child: Image.asset(
          //             'assets/images/expand.png',
          //             color: Colors.white,
          //           ),
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      )
          : Image.file(
        // from Camera screen
        image,
        width: width.toDouble(),
        height: height.toDouble(),
        fit: BoxFit.cover,
      ),
    );
  }
}
