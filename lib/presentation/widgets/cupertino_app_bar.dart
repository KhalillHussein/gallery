part of widgets;

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CupertinoAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(left: AppInsets.insetsPadding),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
