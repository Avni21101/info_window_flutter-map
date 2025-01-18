import 'package:flutter/material.dart';

class PopupContainer extends StatelessWidget {
  const PopupContainer({
    required this.onCloseTap,
    this.imageUrl,
    this.title,
    this.description,
    this.rating,
    super.key,
  });

  final String? imageUrl;
  final String? title;
  final String? description;
  final int? rating;
  final VoidCallback onCloseTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: MediaQuery.sizeOf(context).width / 1.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 15)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  imageUrl ?? '',
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title ?? '',
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  description ?? '',
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ),
              if (rating != 0 || rating != null) ...[
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      rating!,
                      (_) => const Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                )
              ],
              const SizedBox(height: 8),
            ],
          ),
        ),
        Positioned(
          top: 5, // Adjust the top position to overlap slightly
          right: 5,
          child: GestureDetector(
            onTap: onCloseTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5),
              ),
              child: const Icon(
                Icons.close_outlined,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
