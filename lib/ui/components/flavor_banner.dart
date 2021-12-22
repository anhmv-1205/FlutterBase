import 'package:flutter/material.dart';
import 'package:flutter_base_project/config/flavor_config.dart';
import 'package:flutter_base_project/ui/components/device_dialog.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;
    if (flavorConfig == null || flavorConfig.flavor == Flavor.production) {
      return child;
    }
    return Stack(
      children: [
        child,
        _buildFlavorBanner(flavorConfig, context),
      ],
    );
  }

  Widget _buildFlavorBanner(FlavorConfig flavorConfig, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => const DeviceInfoDialog(),
        );
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: flavorConfig.name,
            textDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            layoutDirection: Directionality.of(context),
            color: flavorConfig.color,
          ),
        ),
      ),
    );
  }
}
