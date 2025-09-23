import 'package:cas_natal_app_admin/cores.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/bt_lista_widget.dart';
import 'package:cas_natal_app_admin/widgets/botoes_padrao/flutuante_widget.dart';
import 'package:cas_natal_app_admin/widgets/inputs/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GestaoAulaPage extends StatefulWidget {
  const GestaoAulaPage({super.key});

  @override
  State<GestaoAulaPage> createState() => _GestaoAulaPageState();
}

class _GestaoAulaPageState extends State<GestaoAulaPage> {
  final ScrollController scrollController = ScrollController(); // adicionado
  final cor = Cores();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de aulas'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchBarWidget(),
        ),
      ),

      floatingActionButton: BotaoFlutuanteWidget(
        onPressed: () => context.goNamed('CadastroAula'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: cor.cinzaClaro,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              radius: const Radius.circular(10),
              child: ListView.separated(
                controller: scrollController,
                padding: const EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 12),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: 1,
                itemBuilder: (_, index) {
                  return ButtonLista(
                    txt: 'Aula 1 - Origens da Comunidade Surda no Brasil',
                    onPressed: () {
                      context.goNamed('AlterarAula');
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}