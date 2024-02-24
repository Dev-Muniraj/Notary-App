import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/size.dart';
import '../components/list_tile_data.dart';
import '../provider/home_provider.dart';
import '../response/notary_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _foundUsers = [];
  List<Leads> leadsData = [];

  HomePageProvider provider = HomePageProvider();

  @override
  void initState() {
    super.initState();
    provider = context.read<HomePageProvider>();

    provider.sampleApi().then((_) {
      setState(() {
        leadsData = provider.leadData;
        _foundUsers = leadsData;
      });
    });
  }

  void _filter(String enteredData) {
    if (enteredData.isEmpty) {
      setState(() {
        _foundUsers = leadsData;
      });
    } else {
      setState(() {
        _foundUsers = leadsData
            .where((brandList) => brandList.firstName!
                .toLowerCase()
                .contains(enteredData.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notary App",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white),
          ),
        ),
        body: Consumer<HomePageProvider>(
          builder: (_, p, c) {
            return SafeArea(
              child: p.ifLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : p.error
                      ? Center(
                          child: Text(p.errorMessage),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.md, vertical: Sizes.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: Sizes.sm),
                              Text(
                                "List view search",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: Sizes.sm),
                              TextField(
                                onChanged: (v) {
                                  _filter(v);
                                },
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  prefixIcon: const Icon(
                                    CupertinoIcons.search,
                                    color: Colors.blue,
                                  ),
                                  suffixIcon: const Icon(
                                    CupertinoIcons.xmark,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _foundUsers.length,
                                  itemBuilder: (context, i) {
                                    return ListTileData(
                                        leadData: _foundUsers[i]);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
            );
          },
        ));
  }
}
