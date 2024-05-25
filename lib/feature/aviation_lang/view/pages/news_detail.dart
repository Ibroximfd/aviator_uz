import 'package:aviatoruz/data/entity/news_model.dart';
import 'package:aviatoruz/feature/news/view_model/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

class NewsDetail extends ConsumerWidget {
  final NewsModel item;
  const NewsDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset("assets/icons/arrow_back.png"),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        height: 500,
                        width: double.maxFinite,
                        child: PhotoView(
                          imageProvider: NetworkImage(item.imageUrl),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 2,
                        ),
                      ),
                    );
                  },
                );
              },
              child: SizedBox(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Text(
                " ${item.title}",
                style: GoogleFonts.aBeeZee(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                item.description,
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
