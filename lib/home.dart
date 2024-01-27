import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:riverpod_app/components/card.dart';
import 'package:riverpod_app/components/const.dart';
import 'package:riverpod_app/components/dedtals.dart';
import 'package:riverpod_app/components/navbar.dart';
import 'package:riverpod_app/components/search.dart';
import 'package:riverpod_app/models/const.dart';

import 'package:riverpod_app/models/model_product.dart';
import 'package:riverpod_app/providers/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProvider = ref.watch(showProductsProvider);
    
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        extendBody: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              backgroundColor: bgNavbar,
              title: const Search(),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1591085686350-798c0f9faa7f?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))),
                  ),
                  Container(
                    color: Colors.black.withOpacity(.5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Shop what you need!',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'JUST FOR YOU!',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                          Flexible(
                              child: LottieBuilder.network(
                                  "https://lottie.host/1f0ce3e8-3ea4-49fe-8125-9af227dae49f/FmSnVEFKKj.json")),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
            SliverToBoxAdapter(
              child: productProvider.when(
                data: (productProvider) {
                  final List<ProductModel> products =
                      productProvider.map((e) => e).toList();
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories_prods.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            categories_prods[index],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                              child: MasonryGridView.count(
                                  primary: true,
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
