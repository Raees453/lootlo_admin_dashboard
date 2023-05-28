import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lootlo_app_admin_dash/models/product.dart';
import 'package:lootlo_app_admin_dash/utils/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductTileWidget extends StatefulWidget {
  const ProductTileWidget({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => buildDesktopView(_),
    );
  }

  Widget buildDesktopView(BuildContext context) {
    final PageController pageController = PageController();
    return GridTile(
      footer: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenPaddingValue / 1.5,
        ),
        decoration: const BoxDecoration(
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.product.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              'Rs ${widget.product.price}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            Text(
              widget.product.description,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
      child: Container(
        height: 400,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: widget.product.imageUrls.length,
                controller: pageController,
                itemBuilder: (context, index) => SizedBox(
                  height: 250,
                  child: ImageWithHoverEffect(
                    imageUrl: widget.product.imageUrls[index],
                    onNext: () => pageController.animateToPage(
                      ++currentImageIndex,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    ),
                    onPrevious: () => pageController.animateToPage(
                      --currentImageIndex,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ImageWithHoverEffect extends HookWidget {
  final String imageUrl;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const ImageWithHoverEffect({
    super.key,
    required this.imageUrl,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 300,
              height: 200,
            ),
          ),
          if (isHovered.value)
            Positioned(
              left: 5,
              top: 0,
              bottom: 0,
              child: buildIconButton(context, Icons.arrow_back, onPrevious),
            ),
          if (isHovered.value)
            Positioned(
              right: 5,
              top: 0,
              bottom: 0,
              child: buildIconButton(context, Icons.arrow_forward, onNext),
            ),
        ],
      ),
    );
  }

  Widget buildIconButton(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
