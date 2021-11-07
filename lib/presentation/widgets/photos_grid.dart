part of widgets;

enum GalleryType {
  gallery,
  user,
}

class PhotosGrid extends StatefulWidget {
  const PhotosGrid({
    Key? key,
    this.galleryType = GalleryType.gallery,
  }) : super(key: key);

  final GalleryType galleryType;

  @override
  State<PhotosGrid> createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {
  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    if (widget.galleryType == GalleryType.user) {
      context
          .read<PhotosFilterCubit>()
          .byUser(context.read<AuthenticationCubit>().state.user!.id);
    } else {
      context.read<PhotosFilterCubit>().byUser(null);
    }
    _pagingController.addPageRequestListener(fetchPage);
    super.initState();
  }

  void fetchPage(int page) {
    context.read<PhotosFilterCubit>().loadWithFilters(currentPage: page);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => context.read<PhotosPaginationCubit>().refresh(),
      ),
      child: BlocListener<PhotosPaginationCubit, PaginationState<Photo>>(
        listener: (context, state) {
          _pagingController.value = PagingState(
            nextPageKey: state.nextPageKey,
            error: state.error,
            itemList: state.itemList,
          );
        },
        child: PagedGridView<int, Photo>(
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          pagingController: _pagingController,
          padding: EdgeInsets.fromLTRB(
            AppInsets.insetsPadding,
            20,
            AppInsets.insetsPadding,
            10,
          ),
          gridDelegate: widget.galleryType == GalleryType.user
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                )
              : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                ),
          builderDelegate: PagedChildBuilderDelegate<Photo>(
            itemBuilder: (context, item, index) => _PhotoGridItem(photo: item),
            firstPageErrorIndicatorBuilder: (_) => Error(),
            firstPageProgressIndicatorBuilder: (_) => Loading(),
            newPageErrorIndicatorBuilder: (_) => GestureDetector(
              onTap:
                  context.read<PhotosPaginationCubit>().retryLastFailedRequest,
              child: Padding(
                padding: const EdgeInsets.all(AppInsets.insetsPadding),
                child: Column(
                  children: const [
                    Text(
                      AppLocalization.textSomethingWentWrong,
                    ),
                    SizedBox(height: 6),
                    Icon(
                      Icons.refresh,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            newPageProgressIndicatorBuilder: (_) => Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Loading(
                  loadingType: LoadingType.withoutLabel,
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
