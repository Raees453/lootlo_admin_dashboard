import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(HoverEffectApp());
}

class HoverEffectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hover Effect Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hover Effect Demo')),
      body: Center(
        child: ImageWithHoverEffect(
          imageUrl: 'assets/images/customer.jpg',
          onNext: () {
            // TODO: Handle next button tap
          },
          onPrevious: () {
            // TODO: Handle previous button tap
          },
        ),
      ),
    );
  }
}

class ImageWithHoverEffect extends HookWidget {
  final String imageUrl;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const ImageWithHoverEffect({super.key,
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
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 300,
            height: 200,
          ),
          if (isHovered.value)
            Positioned(
              left: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: onPrevious,
                color: Colors.white,
              ),
            ),
          if (isHovered.value)
            Positioned(
              right: -20,
              top: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: onPrevious,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
