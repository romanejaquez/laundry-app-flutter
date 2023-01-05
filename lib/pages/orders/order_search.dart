import 'package:flutter/material.dart';
import 'package:laundry_app/helpers/laundry_colors.dart';

class OrderSearch extends StatefulWidget {
  const OrderSearch({super.key});

  @override
  State<OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {

  late TextEditingController searchField;


  @override 
  void initState() {
    super.initState();

    searchField = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.grey.withOpacity(0.20),
              width: 5
            )
          ),
          height: 75,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchField,
                  style: const TextStyle(fontSize: 25),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'i.e. BXC54567',
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Material(
                  color: LaundryAppColors.darkBlue.withOpacity(0.5),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: LaundryAppColors.darkBlue.withOpacity(0.5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(width: 10),
                          Text('Search',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )
                          ),
                          SizedBox(width: 10),
                        ]
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Spacer()
      ],
    );
  }
}