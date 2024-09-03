import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application_1/bars/webappbar.dart';

import 'mobileappbar.dart';

class FixedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final Function(String) onSearchChanged;
  final VoidCallback onSearchClear;
  final String searchQuery;
  final TabController tabController;

  const FixedAppBar({
    super.key,
    this.isSearching = false,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.searchQuery,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return WebAppBar(
        isSearching: isSearching,
        onSearchChanged: onSearchChanged,
        onSearchClear: onSearchClear,
        searchQuery: searchQuery,
        tabController: tabController,
      );
    } else {
      return MobileAppBar(
        isSearching: isSearching,
        onSearchChanged: onSearchChanged,
        onSearchClear: onSearchClear,
        searchQuery: searchQuery,
        tabController: tabController,
      );
    }
  }

  @override
  Size get preferredSize => kIsWeb? const Size.fromHeight(49): const Size.fromHeight(99);
}
