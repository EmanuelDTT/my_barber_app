import 'package:flutter/material.dart';
import 'service_card.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  static const Map<String, String> servicios = {
    'corte': 'Corte de cabello básico',
    'combo': 'Corte + Barba',
    'facial': 'Tratamiento facial',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServiceCard(
          title: servicios['corte']!,
          location: 'Don Bigote - Plaza del Parque',
          address: 'cr 36 #11-13 Plaza del parque Barranquilla',
          icon: Icons.content_cut,
          onReserve: () {
            Navigator.pushNamed(context, '/reserva', arguments: 'corte');
          },
        ),
        const SizedBox(height: 12),
        ServiceCard(
          title: servicios['combo']!,
          location: 'Barbería El Clásico',
          address: 'Calle 84 #52-15 Barrio El Prado',
          icon: Icons.face,
          onReserve: () {
            Navigator.pushNamed(context, '/reserva', arguments: 'combo');
          },
        ),
        const SizedBox(height: 12),
        ServiceCard(
          title: servicios['facial']!,
          location: 'Spa Masculino Premium',
          address: 'Carrera 53 #70-40 Barranquilla',
          icon: Icons.face_retouching_natural,
          onReserve: () {
            Navigator.pushNamed(context, '/reserva', arguments: 'facial');
          },
        ),
      ],
    );
  }
}
