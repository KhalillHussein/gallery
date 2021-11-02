part of profile;

class PhotosGrid extends StatefulWidget {
  const PhotosGrid({
    Key? key,
    this.imageCount = 10,
  }) : super(key: key);

  final int imageCount;

  @override
  State<PhotosGrid> createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {
  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      context.read<PhotosCubit>().loadData(PhotosApiQuery(
              popularImg: null,
              newImg: null,
              page: page,
              limit: widget.imageCount,
              userId: context.read<SignInCubit>().state.value?.id ??
                  context.read<SignUpCubit>().state.value!.id)
          .toMap());
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhotosCubit, RequestState<List<Photo>>>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          if (state.value!.length < widget.imageCount) {
            _pagingController.appendLastPage(state.value!);
          } else {
            _pagingController.appendPage(state.value!, state.nextPage);
          }
        } else if (state.status.isFailure) {
          _pagingController.error = state.errorMessage;
        }
      },
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedGridView<int, Photo>(
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: _pagingController,
          padding: EdgeInsets.fromLTRB(
            AppInsets.insetsPadding,
            20,
            AppInsets.insetsPadding,
            10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          builderDelegate: PagedChildBuilderDelegate<Photo>(
            itemBuilder: (context, item, index) => _PhotoGridItem(photo: item),
            firstPageErrorIndicatorBuilder: (_) => Error(),
            firstPageProgressIndicatorBuilder: (_) => Loading(),
            newPageProgressIndicatorBuilder: (_) => Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Loading(
                  loadingType: LoadingType.list,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoGridItem extends StatelessWidget {
  const _PhotoGridItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      photo.photoUrl,
      cacheWidth: 400,
      fit: BoxFit.cover,
    )
        .clipRRect(all: 10)
        .elevation(
          4,
          shadowColor: AppColors.colorGray_1,
          borderRadius: BorderRadius.circular(10),
        )
        .gestures(
          onTap: () => Navigator.pushNamed(context, AppRoutes.photoDetail,
              arguments: {'photo': photo}),
        );
  }
}
