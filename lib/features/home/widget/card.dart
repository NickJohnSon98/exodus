import 'package:exodus/app_data/app_data.dart';
import 'package:flutter/cupertino.dart';

class HomeCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const HomeCard({super.key, required this.child, required this.onTap});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _isHover = true;
      }),
      onExit: (event) => setState(() {
        _isHover = false;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          height: _isHover ? 240 : 230,
          width: _isHover ? 280 : 260,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: AppData.colors.homeBgColor.withOpacity(0.08),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            color: _isHover
                ? AppData.colors.homeCardHoverBg
                : AppData.colors.homeCardBg,
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
