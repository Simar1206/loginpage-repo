import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class FavoriteSearchPage extends StatefulWidget {
  const FavoriteSearchPage({super.key});

  @override
  State<FavoriteSearchPage> createState() => _FavoriteSearchPageState();
}

class _FavoriteSearchPageState extends State<FavoriteSearchPage> {
  //is empty condition
  final bool _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*title
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Find Your\nFavorite Food',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  //*Search Bar
                  TextField(
                    enableSuggestions: true,
                    // expands: true,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD6D6D6)),
                      ),
                      hintText: 'Search for youre food',
                      prefixIcon: Icon(Icons.search_outlined),
                      suffixIcon: Icon(Icons.tune),
                    ),
                  ),
                  SizedBox(height: 40),
                  _isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assests/favoritepage.png',
                              width: 172,
                              height: 128,
                            ),

                            SizedBox(height: 16),

                            Text(
                              "We couldn't find any result!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Please check your search for any typos or spelling errors, or try a different search term.",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: ConstantColors.greycolor,
                              ),
                            ),
                          ],
                        )
                      : Container(child: Text('Not Empty')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
