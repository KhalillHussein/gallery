part of welcome;

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      filterQuality: FilterQuality.high,
      width: 136,
      height: 139,
    );
  }
}
