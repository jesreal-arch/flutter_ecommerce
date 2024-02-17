import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_app/auth/auth_riverpod.dart';
import 'package:riverpod_app/components/appbar.dart';

import 'package:riverpod_app/components/card.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/components/dedtals.dart';
import 'package:riverpod_app/components/navbar.dart';
import 'package:riverpod_app/components/search.dart';
import 'package:riverpod_app/models/const.dart';

import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/addtocart.dart';
import 'package:riverpod_app/providers/firebase/firebase_riverpod.dart';
import 'package:riverpod_app/providers/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchprovider = ref.watch(searchProvider);
    final header = ref.watch(currentIndexProviderHeader);
    final productProvider =
        ref.watch(ShowProductsProvider("${header + 1}", searchprovider));
    final category = ref.watch(showcategoryProvider);
    final userToken = ref.watch(userTokenProvider);
    final currentUser = ref.watch(CurrentUserProvider(userToken));
    final categorySegmented = ref.watch(showcategoryProvider);
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        extendBody: true,
        body: CustomScrollView(
          physics: const ScrollPhysics(),
          slivers: [
            AppBarCarousel(
                currentUser.when(data: (currentUser) {
                  return currentUser.avatar;
                }, error: (e, s) {
                  return "https://cdn.pixabay.com/photo/2018/01/04/15/51/404-error-3060993_640.png";
                }, loading: () {
                  return "https://cdn-icons-png.flaticon.com/512/5509/5509456.png";
                }),
                currentUser.when(data: (currentUser) {
                  return currentUser.name;
                }, error: (e, s) {
                  return "Who are  You? ";
                }, loading: () {
                  return "Please Wait";
                })),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Search(),
              ),
            ),
            SliverToBoxAdapter(
              child: categorySegmented.when(
                data: (categorySegmented) {
                  final List<CategoryModel> categories =
                      categorySegmented.map((e) => e).toList();
                  return Padding(
                     padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categories",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(currentIndexProviderHeader.notifier)
                                        .update((state) {
                                      return i;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(3, 0),
                                                    blurRadius: 6,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        categories[i].image))),
                                          ),
                                        ),
                                        Text(
                                          categories[i].name,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: header !=i ? FontWeight.w400: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                },
                error: ((error, stackTrace) {
                  return Center(child: Text(error.toString()));
                }),
                loading: () {
                  return Center(
                    child: LottieBuilder.network(
                        "https://lottie.host/cc8b7237-8dc1-475c-8ee1-2f0a61ecea96/xQEeIYCbGy.json"),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: productProvider.when(
                data: (productProvider) {
                  final List<ProductModel> products =
                      productProvider.map((e) => e).toList();
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 3,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New collections!",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: MasonryGridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return DraggableScrollableSheet(
                                                  expand: false,
                                                  initialChildSize: .9,
                                                  builder: ((context,
                                                      scrollController) {
                                                    return DetailsCart(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              backgroundColor:
                                                                  bgNavbar,
                                                              title: Text(
                                                                'Add to cart',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                              content: Text(
                                                                  'Add this product to your cart?',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                          color:
                                                                              Colors.white)),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  child: Text(
                                                                      'Cancel',
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              Colors.white)),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child: Text(
                                                                      'Confirm',
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              Colors.white)),
                                                                  onPressed:
                                                                      () {
                                                                    ref.read(AddtoCartProvider(
                                                                        products[
                                                                            index],
                                                                        currentUser
                                                                            .value!
                                                                            .name));

                                                                    ref
                                                                        .read(cartProvider
                                                                            .notifier)
                                                                        .addTocart(
                                                                            products[index]);
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    // Handle the confirm action
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      productModel:
                                                          products[index],
                                                    );
                                                  }));
                                            });
                                      },
                                      child: ProductCard(
                                        products: products,
                                        index: index,
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  );
                },
                error: ((error, stackTrace) {
                  return Center(child: Text(error.toString()));
                }),
                loading: () {
                  return Center(
                    child: LottieBuilder.network(
                        "https://lottie.host/cc8b7237-8dc1-475c-8ee1-2f0a61ecea96/xQEeIYCbGy.json"),
                  );
                },
              ),
            )
          ],
        ));
  }
}
