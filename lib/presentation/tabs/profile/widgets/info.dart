part of profile;

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                ),
          ),
          TextSpan(
            text: subtitle,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
