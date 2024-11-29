import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(20, 27, 50, 1.0),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            // Icon search
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            // TextField for search input
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Movie',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 73, 173, 255),
                    Color.fromRGBO(98, 179, 246, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.settings_input_composite_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Thêm hành động tại đây (nếu cần)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
