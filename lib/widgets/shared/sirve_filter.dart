import 'package:flutter/material.dart';

class ServiceFilters extends StatefulWidget {
  final Function(String)? onFilterSelected;
  final String? initialFilter;
  final List<Map<String, dynamic>>? customFilters;

  const ServiceFilters({
    super.key,
    this.onFilterSelected,
    this.initialFilter,
    this.customFilters,
  });

  @override
  State<ServiceFilters> createState() => _ServiceFiltersState();
}

class _ServiceFiltersState extends State<ServiceFilters> {
  late String selectedFilter;
  
  late final List<Map<String, dynamic>> filters;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.initialFilter ?? 'Todos';
    
    filters = widget.customFilters ?? [
      {'name': 'Todos', 'icon': Icons.all_inclusive},
      {'name': 'Corte', 'icon': Icons.content_cut},
      {'name': 'Barba', 'icon': Icons.face},
      {'name': 'Facial', 'icon': Icons.face_retouching_natural},
      {'name': 'Afro', 'icon': Icons.waves},
      {'name': 'Manicure', 'icon': Icons.back_hand},
      {'name': 'Masaje', 'icon': Icons.spa},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Filtrar por servicio',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                final isSelected = selectedFilter == filter['name'];
                
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < filters.length - 1 ? 12.0 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter['name'];
                      });
                      widget.onFilterSelected?.call(filter['name']);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? Theme.of(context).primaryColor 
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected 
                              ? Theme.of(context).primaryColor 
                              : Colors.grey[300]!,
                          width: 1,
                        ),
                        boxShadow: isSelected ? [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ] : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            filter['icon'],
                            size: 18,
                            color: isSelected ? Colors.white : Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            filter['name'],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey[700],
                              fontWeight: isSelected 
                                  ? FontWeight.w600 
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}