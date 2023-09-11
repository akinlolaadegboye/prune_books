import 'package:prune/data/sources/shared/models/books.dart';
import 'package:prune/presentation/animation/fade_animation.dart';
import 'package:prune/presentation/components/home.dart';
import 'package:prune/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:prune/extensions/state_widget.dart';
import 'package:prune/presentation/components/general.dart';
import 'package:prune/values/colors.dart';
import 'package:prune/values/strings.dart';
import 'package:prune/values/styles.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel? _viewModel;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    postFrameCallback(() {
      _viewModel!.onNext(LoadData());
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel ??= Provider.of<HomeViewModel>(context);
    postFrameCallback(_listenToState);
    print('ERROR_T ::: ${_viewState.error}');
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: LTColors.pry,
        body: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: LTColors.pryLight,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              if (_viewState.showMainView) ...[
                _bookLayout,
              ],
              if ('${_viewState.error}' == Strings.internetCheckString)
                _internetConnectionErrorWidget,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get _space {
    return verticalSpacingWidget();
  }


  get _bookLayout {
    return Container(
      height: GeneralUtils().getScreenHeight(context),
      margin: const EdgeInsets.only(left: 22, right: 22),
      child: Column(
        children: [_space, _space, _booksHeader, _space, _books],
      ),
    );
  }

  get _booksHeader {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Strings.books,
          style: TextStyles.boldSecSmallBody.copyWith(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  get _books {
    return Expanded(
        child: FadeAnimation(
      delay: 1.5,
      child: _viewState.showMainView
          ? ListView.builder(
              itemCount: _viewState.books!.length,
              itemBuilder: (context, index) {
                Books books = _viewState.books![index];
                return FadeAnimation(
                    delay: GeneralUtils().delayDuration(1.5, index),
                    child: BookItem(
                     books: books,
                    ));
              })
          : _space,
    ));
  }

  InternetConnectionErrorWidget get _internetConnectionErrorWidget {
    return InternetConnectionErrorWidget(onClickRetry: () {
      _viewModel!.onNext(LoadData());
    });
  }

  void _listenToState() async {
    await switchLoading(show: _viewState.showLoading);
    await switchError(_viewState.error);
  }

  HomeViewState get _viewState => _viewModel!.state;
}
