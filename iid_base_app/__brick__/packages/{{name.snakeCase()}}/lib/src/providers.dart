import 'package:app/src/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
  const Providers({
    super.key,
    this.repository,
    required this.child,
  });

  final Repository? repository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Repository>(
          create: (_) => repository ?? Repository(),
        ),
      ],
      child: child,
    );
  }
}
