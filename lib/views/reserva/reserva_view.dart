import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ReservaView extends StatefulWidget {
  const ReservaView({super.key});

  @override
  State<ReservaView> createState() => _ReservaViewState();
}

class _ReservaViewState extends State<ReservaView> {
  String? servicioSeleccionado;
  DateTime? fechaSeleccionada;

  static const Map<String, String> servicios = {
    'corte': 'Corte de cabello básico',
    'barba': 'Afeitado de Barba',
    'combo': 'Corte + Barba',
    'facial': 'Tratamiento facial',
  };

  final List<DateTime> proximasFechas = List.generate(
    7,
    (i) => DateTime.now().add(Duration(days: i)),
  );

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES', null);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null && argumento is String && servicios.containsKey(argumento)) {
      setState(() {
        servicioSeleccionado = argumento;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          },
        ),
        title: const Text('Reservar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selecciona un servicio:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: servicioSeleccionado,
              items: servicios.entries.map((entry) {
                return DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  servicioSeleccionado = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Elige un servicio',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Selecciona una fecha:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: proximasFechas.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final fecha = proximasFechas[index];
                  final seleccionada = fechaSeleccionada != null &&
                      fechaSeleccionada!.day == fecha.day &&
                      fechaSeleccionada!.month == fecha.month;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        fechaSeleccionada = fecha;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: seleccionada ? Colors.black : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: seleccionada ? Colors.black : Colors.grey.shade400,
                          width: seleccionada ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEE', 'es_ES').format(fecha).toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: seleccionada ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('d', 'es_ES').format(fecha),
                            style: TextStyle(
                              fontSize: 22,
                              color: seleccionada ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('MMM', 'es_ES').format(fecha),
                            style: TextStyle(
                              fontSize: 12,
                              color: seleccionada ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (servicioSeleccionado == null || fechaSeleccionada == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Completa todos los campos')),
                    );
                    return;
                  }

                  final String fechaFormateada =
                      DateFormat('EEEE d MMMM', 'es_ES').format(fechaSeleccionada!);
                  final String servicioNombre = servicios[servicioSeleccionado!] ?? 'Servicio';

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Reserva para $servicioNombre el $fechaFormateada'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Confirmar Reserva'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
