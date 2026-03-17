import 'package:flutter/material.dart';
import '../modelo/aluno.dart';
import 'tela_imc.dart';
import 'dart:ui';

class DadosAntropometria extends StatefulWidget {
  final Aluno aluno;

  const DadosAntropometria({super.key, required this.aluno});

  @override
  State<DadosAntropometria> createState() => _DadosAntropometriaState();
}

class _DadosAntropometriaState extends State<DadosAntropometria> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final tricepsController = TextEditingController();
  final subescapularController = TextEditingController();
  final suprailicaController = TextEditingController();
  final abdomenDobrasController = TextEditingController();

  final bracoDirController = TextEditingController();
  final bracoEsqController = TextEditingController();
  final antebracoDirController = TextEditingController();
  final antebracoEsqController = TextEditingController();
  final abdomenCircController = TextEditingController();
  final quadrilController = TextEditingController();
  final cinturaController = TextEditingController();
  final coxaDirController = TextEditingController();
  final coxaEsqController = TextEditingController();
  final pernaDirController = TextEditingController();
  final pernaEsqController = TextEditingController();

  @override
  void dispose() {
    tricepsController.dispose();
    subescapularController.dispose();
    suprailicaController.dispose();
    abdomenDobrasController.dispose();
    bracoDirController.dispose();
    bracoEsqController.dispose();
    antebracoDirController.dispose();
    antebracoEsqController.dispose();
    abdomenCircController.dispose();
    quadrilController.dispose();
    cinturaController.dispose();
    coxaDirController.dispose();
    coxaEsqController.dispose();
    pernaDirController.dispose();
    pernaEsqController.dispose();
    super.dispose();
  }

  void _irParaTelaImc() {
    if (_formKey.currentState!.validate()) {
      widget.aluno.triceps = tricepsController.text;
      widget.aluno.subescapular = subescapularController.text;
      widget.aluno.suprailica = suprailicaController.text;
      widget.aluno.abdomenDobras = abdomenDobrasController.text;

      widget.aluno.bracoDir = bracoDirController.text;
      widget.aluno.bracoEsq = bracoEsqController.text;
      widget.aluno.antebracoDir = antebracoDirController.text;
      widget.aluno.antebracoEsq = antebracoEsqController.text;
      widget.aluno.abdomenCirc = abdomenCircController.text;
      widget.aluno.quadril = quadrilController.text;
      widget.aluno.cintura = cinturaController.text;
      widget.aluno.coxaDir = coxaDirController.text;
      widget.aluno.coxaEsq = coxaEsqController.text;
      widget.aluno.pernaDir = pernaDirController.text;
      widget.aluno.pernaEsq = pernaEsqController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaImc(aluno: widget.aluno),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight =
        MediaQuery.of(context).padding.top + kToolbarHeight;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Dados Antropométricos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon:
          const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/academia6.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: const Color.fromARGB(140, 0, 0, 0),
          ),

          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
                16, appBarHeight + 16, 16, 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dobras Cutâneas (mm)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildTextField("Tríceps", tricepsController),
                  _buildTextField("Subescapular", subescapularController),
                  _buildTextField("Suprailíaca", suprailicaController),
                  _buildTextField("Abdômen", abdomenDobrasController),

                  const SizedBox(height: 24),

                  const Text(
                    'Circunferências (cm)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildTextField("Braço (dir)", bracoDirController),
                  _buildTextField("Braço (esq)", bracoEsqController),
                  _buildTextField("Antebraço (dir)", antebracoDirController),
                  _buildTextField("Antebraço (esq)", antebracoEsqController),
                  _buildTextField("Abdômen", abdomenCircController),
                  _buildTextField("Quadril", quadrilController),
                  _buildTextField("Cintura", cinturaController),
                  _buildTextField("Coxa (dir)", coxaDirController),
                  _buildTextField("Coxa (esq)", coxaEsqController),
                  _buildTextField("Perna (dir)", pernaDirController),
                  _buildTextField("Perna (esq)", pernaEsqController),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _irParaTelaImc,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                      minimumSize:
                      const Size.fromHeight(50),
                    ),
                    child: const Text("Próximo"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter:
          ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                labelText: label,
                labelStyle:
                const TextStyle(color: Colors.white),
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}