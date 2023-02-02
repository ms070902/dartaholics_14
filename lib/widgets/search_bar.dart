import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.height,
    required this.width,
    required this.controller,
    required this.title,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final TextEditingController controller;
  final Function onChanged;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(left: 10, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.50,
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: onChanged(),
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: title,
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 20.0, 0),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
