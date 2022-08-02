import 'package:base_flutter/base/common_utils/diff_image.dart';
import 'package:base_flutter/base/common_utils/log_utils.dart';
import 'package:base_flutter/config/dependency_injection/dependency_injection.dart';
import 'package:base_flutter/features/favorite/application/favorite_cubit.dart';
import 'package:base_flutter/features/favorite/data/model/favorite_model.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else if (state is FavoriteLoaded) {
            Log.i("List of favorites  ${state.favorites!.length}" );
            return GridView.builder(
              shrinkWrap: true,
              itemCount: state.favorites!.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .8,
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {},
                    // onTap: () => restaurantPressed(context, state, index),
                    child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 1,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                DiffImage(
                                  height: size.height * .17,
                                  width: double.infinity,
                                  raduis: 25.0,
                                  onClick: false,
                                  onUserTap: () {
                                    // restaurantPressed(
                                    //     context, state, index);
                                  },
                                  image: state.favorites![index].image ==
                                          null
                                      ? "https://www.4-pieds.com/blog/wp-content/uploads/2020/06/e20t20victoria20hpl2020pisa20fd0149-tif-1340x670.jpg"
                                      : state.favorites![index].image!,
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(12),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey.shade800),
                                        child: Row(
                                          children: [
                                            Text(
                                              state.favorites![index]
                                                          .rate !=
                                                      null
                                                  ? state.favorites![index]
                                                      .rate!
                                                  : "5.0",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.redAccent),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellowAccent,
                                              size: 13,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: LikeButton(
                                            isLiked: state
                                                .favorites![index].isFav,
                                            // onTap: (isLiked) =>
                                            //     onLikeButtonTapped(
                                            //         isLiked, state, index),
                                            likeBuilder: (bool islike) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.all(2),
                                                width: 15,
                                                height: 22,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius
                                                                .all(
                                                            Radius.circular(
                                                                6)),
                                                    color: Colors
                                                        .grey.shade800),
                                                child: Icon(
                                                  islike
                                                      ? FontAwesomeIcons
                                                          .solidHeart
                                                      : FontAwesomeIcons
                                                          .heart,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                state.favorites![index].category!.nameAr!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFFc9501c)),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                state.favorites![index].nameAr!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: size.height * .05,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                    color: const Color(0xFFc7fcf8)
                                        .withOpacity(.5)),
                                child:  Center(
                                  child: Text(
                                   S.of(context).appName,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        )));
              },
            );
          } else if (state is FavoriteFailure) {
            Log.e("Error Failure");
            return Text(state.failureMessage);
          } else {
            return Text("stateeeeeeeee");
          }
        },
      ),
    );
  }

// Future<bool> onLikeButtonTapped(bool isLiked, GetResturantSuccess state,
//     int index) async {
//   BlocProvider.of<ToggleFavoritesCubit>(context).toggleFavorites(
//       state.resturantList[index].id!, "restaurant", isLiked ? 0 : 1);
//   return !isLiked;
// }

// restaurantPressed(BuildContext context, GetResturantSuccess state,
//     int index) async {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//         builder: (context) =>
//             DetailsResturantScreen(resturant: state.resturantList[index])),
//   );
// }
}
