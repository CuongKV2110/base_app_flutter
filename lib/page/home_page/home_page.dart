import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import '../../constants/constants.dart';
import '../../module/blocs/Home_bloc/Home_bloc.dart';
import '../../module/blocs/Home_bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = HomeBloc();
  CarouselSliderController sliderController = CarouselSliderController();
  @override
  void initState() {
    super.initState();
    _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackground,
        body: BlocProvider<HomeBloc>.value(
          value: _bloc,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return _build(state);
            },
          ),
        ),
      ),
    );
  }

  _build(HomeState state) {
    if (state is HomeError) {
      return const Center(
        child: Text("Error"),
      );
    } else if (state is HomeSuccess) {
      List<CourseDto> listCourse = _bloc.list;
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  controller: sliderController,
                  slideBuilder: (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              width: 300,
                              height: 180,
                              imageUrl: listCourse[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: listCourse.length,
                  initialPage: 0,
                  enableAutoSlider: false,
                ),
              ),
              hSpaceItem3,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Text("See all"),
                ],
              ),
              hSpaceItem2,
              SizedBox(
                height: 360,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.greenAccent,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
