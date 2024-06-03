import 'package:flutter/material.dart';
import 'package:rct/constants/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class CardContainer extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onTap;
  const CardContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: whiteBackGround,
      color: whiteBackGround,
      child: Stack(
        children: [
          const Center(child: CircularProgressIndicator()),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "$imagePath/Rectangle 122.png",
              );
            },
          ),
          // FadeInImage.memoryNetwork(
          //   placeholder: kTransparentImage,
          //   image: image,
          //   imageErrorBuilder: (context, error, stackTrace) {
          //     return Image.asset(
          //       "$imagePath/Rectangle 122.png",
          //     );
          //   },
          // ),

          // Image.asset(imagePath),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // Adjust the width as needed
              width: double.infinity, // Full width
              decoration: BoxDecoration(
                color: whiteBackGround,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ListTile(
                  titleTextStyle: Theme.of(context).textTheme.labelLarge,
                  title: Text(
                    title,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_circle_outlined),
                    onPressed: onTap,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
