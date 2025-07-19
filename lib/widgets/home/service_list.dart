import 'package:flutter/material.dart';
import 'service_card.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ServiceCard(
          title: 'Corte de cabello básico',
          location: 'Don Bigote - Plaza del Parque',
          address: 'cr 36 #11-13 Plaza del parque Barranquilla',
          icon: Icons.content_cut,
        ),
        SizedBox(height: 12),
        ServiceCard(
          title: 'Corte + Barba',
          location: 'Barbería El Clásico',
          address: 'Calle 84 #52-15 Barrio El Prado',
          icon: Icons.face,
        ),
        SizedBox(height: 12),
        ServiceCard(
          title: 'Tratamiento facial',
          location: 'Spa Masculino Premium',
          address: 'Carrera 53 #70-40 Barranquilla',
          icon: Icons.face_retouching_natural,
        ),
      ],
    );
  }
}
