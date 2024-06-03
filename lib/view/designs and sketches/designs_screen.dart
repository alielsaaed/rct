import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/card_container.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/view-model/cubits/designs/designs_cubit.dart';

class DesignsScreen extends StatefulWidget {
  const DesignsScreen({super.key});

  @override
  State<DesignsScreen> createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DesignsCubit>().loadDesigns(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: BlocBuilder<DesignsCubit, DesignsState>(
                  builder: (context, state) {
                    if (state is DesignsLoading) {
                      // Emit loading state while the connection is still incomplete
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is DesignsFailure) {
                      if (kDebugMode) {
                        print("Error in sketches screen: $state ");
                      }
                      // Handle error state
                      return Image.asset(
                          "$imagePath/modul-lettering-404-with-gears-and-exclamation-mark-text.png");
                      // Text('Error: $state');
                    } else if (state is DesignsSuccess) {
                      var data = state.sketches;
                      // Display the data when the future completes
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.sketches.length,
                        itemBuilder: (context, index) {
                          return CardContainer(
                            image:
                                'https://st2.depositphotos.com/159113333/8812/i/450/depositphotos_88120646-stock-photo-idddssdsddsyllic-summer-landscape-with-cllear.jpg',
                            title: data[index]["name"],
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.diagramsDetailsScreen,
                              );
                            },
                          );
                        },
                      );
                    } else {
                      // Handle the case when the future completes with no data
                      return const Text('No data found');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
