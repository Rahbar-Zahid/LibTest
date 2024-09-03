import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';

class ELearningPage extends StatefulWidget {
  const ELearningPage({super.key});

  @override
  ELearningPageState createState() => ELearningPageState();
}

class ELearningPageState extends State<ELearningPage> {
  List<String> categories = ['All', 'Category 1', 'Category 2'];
  List<String> items = List.generate(6, (index) => 'E-learning Item $index');
  List<String> filteredItems = [];
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void filterItems() {
    setState(() {
      filteredItems = items.where((item) {
        return (selectedCategory == 'All' || item.contains(selectedCategory));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'E-learning',
      //     style: TextStyle(color: Colors.white), // Text color for better visibility on dark background
      //   ),
      //   backgroundColor: const Color.fromARGB(255, 12, 88, 150),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16.0), // Space above header
            CustomHeader(
              title: 'E-Learning',
              breadcrumb: 'Home/Customer support > E-Learning',
              onBreadcrumbTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              titleColor: const Color(0xFF191717), // Title color
              breadcrumbColor: const Color(0xFF191717), // Breadcrumb color
              hoverColor: Colors.blue, // Breadcrumb hover color
              backgroundColor: Colors.transparent, // Header background color
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: DropdownButton<String>(
            //           value: selectedCategory,
            //           onChanged: (value) {
            //             setState(() {
            //               selectedCategory = value!;
            //               filterItems();
            //             });
            //           },
            //           items: categories
            //               .map((category) => DropdownMenuItem(
            //             value: category,
            //             child: Text(category, style: const TextStyle(fontSize: 14.0)),
            //           ))
            //               .toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate the number of columns
                  int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.75, // Aspect ratio for cards
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return _buildELearningCard(context, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildELearningCard(BuildContext context, int index) {
    return AspectRatio(
      aspectRatio: 0.75, // Adjust aspect ratio to match the image and card dimensions
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            // Handle card tap (e.g., navigate to a detailed page)
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.asset(
                  'assets/images/customer_support/webinars/webinar.png', // Placeholder image
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filteredItems[index],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Description of ${filteredItems[index]}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}