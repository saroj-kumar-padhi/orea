import 'package:Orea/common_utils/common_utils.dart';
import 'package:Orea/screens/orea_real_estate_bidding/searchfunction.dart';
import 'package:Orea/screens/view_lists/view_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isLoading = false;
  //I call this by searchfunciton
  UserInfodata? user;
  //  Map<String, dynamic>? usersMap;
  TextEditingController searchController = TextEditingController();

  void onSearch() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      setState(() {
        isLoading = true;
      });

      firestore
          .collection('users')
          .where(
            "type",
            isGreaterThanOrEqualTo: searchController.text.trim(),
          )
          .snapshots();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      const Center(child: Text('No property found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    var length = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  // search container
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 25, 12, 10),
                    child: Container(
                      height: length.height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 0),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: const [
                            BoxShadow(color: deepBlue, spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              fillColor: whiteColor,
                              filled: true,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    onSearch();
                                  },
                                  icon: const Icon(Icons.search,
                                      size: 22, color: deepBlue)),
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.apartment,
                                  size: 30, color: deepBlue),
                              hintText: "Search any property...",
                              hintStyle: const TextStyle(color: hint)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where(
                            'type',
                            isGreaterThanOrEqualTo:
                                searchController.text.trim(),
                          )
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            QuerySnapshot dataSnapshot =
                                snapshot.data as QuerySnapshot;
                            if (dataSnapshot.docs.isNotEmpty) {
                              return ListView.builder(
                                itemCount: dataSnapshot.docs.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> userMap =
                                      dataSnapshot.docs[index].data()
                                          as Map<String, dynamic>;
                                  UserInfodata searchedUser =
                                      UserInfodata.fromJson(userMap);

                                  return ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withAlpha(100),
                                        radius: 25,
                                        child: Image.network(
                                          searchedUser.imageUrl ?? "",
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              ((context, error, stackTrace) {
                                            return const Icon(
                                                Icons.account_circle_rounded);
                                          }),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                        searchedUser.propertyTitle.toString()),
                                    subtitle: Text(searchedUser
                                        .propertyDescription
                                        .toString()),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_right_rounded),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewListings()));
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Oops, No item found ! Check upper and lower cases...',
                                  style:
                                      TextStyle(fontSize: 14, color: deepBlue),
                                ),
                              );
                            }
                          } else if (snapshot.hasError) {
                            return const Text('An error occurred !');
                          } else {
                            return const Text('No results found !!');
                          }
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
