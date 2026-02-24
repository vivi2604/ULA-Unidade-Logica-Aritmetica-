# 🔢 Unidade Lógica e Aritmética (ULA)

## 🧠 Sobre o Projeto
Este projeto consiste no desenvolvimento de uma **Unidade Lógica e Aritmética (ULA)** utilizando a linguagem de descrição de hardware **Verilog**, implementada na placa FPGA **DE10-Lite**. A ULA é um dos principais componentes de sistemas digitais, sendo responsável por realizar operações aritméticas e lógicas fundamentais em microprocessadores.


## 👩‍💻 Autoras
- Analuz Lima da Silva  
- Larissa Matos Barbosa  
- Vivian Martins Moura  


## 🎯 Objetivo
Desenvolver uma ULA capaz de:

- Receber dois operandos de **4 bits**
- Utilizar um sinal de entrada **Carry In (Cin)**
- Executar operações aritméticas e lógicas
- Exibir resultados em:
  - Displays de 7 segmentos
  - LEDs da FPGA
- Gerar sinais de controle (flags)


## ⚙️ Funcionalidades

### ➕ Operações Aritméticas
- Soma  
- Subtração  
- Multiplicação  
- Divisão inteira  

### 🔌 Operações Lógicas
- AND  
- OR  
- XOR  

### 🚩 Flags Geradas
- Carry Out  
- Overflow  
- Zero  
- Erro  


## 🧩 Arquitetura do Projeto
O projeto foi desenvolvido de forma **modular**, com aproximadamente **17 módulos em Verilog**, incluindo:
- Meio-somador  
- Somador completo  
- Multiplicador  
- Divisor  
- Módulos lógicos  

Essa abordagem facilita:
- Organização do código  
- Reutilização de componentes  
- Manutenção do projeto  


## 🖥️ Entradas e Saídas

### 🔹 Entradas
- Dois operandos de 4 bits  
- Sinal Carry In (Cin)  
- Chaves de seleção de operação (FPGA)  

### 🔹 Saídas
- Resultado da operação:
  - Displays de 7 segmentos (representação decimal)  
  - LEDs da placa  
- Flags de status  


## 🛠️ Tecnologias Utilizadas
- Verilog HDL  
- FPGA DE10-Lite  
- Quartus (Intel FPGA)  


## ▶️ Como Executar

1. Abrir o projeto no **Quartus**
2. Compilar os arquivos Verilog
3. Realizar a gravação na placa **DE10-Lite**
4. Utilizar as chaves para selecionar as operações
5. Visualizar os resultados nos displays e LEDs


## 📊 Resultados
O projeto atendeu a todos os requisitos propostos, apresentando:

- Execução correta das operações
- Organização modular eficiente
- Visualização adequada dos resultados na FPGA

## 📚 Contexto Acadêmico
Projeto desenvolvido para a disciplina:

**MI - Projeto de Circuitos Digitais**  
Departamento de Tecnologia  
Universidade Estadual de Feira de Santana (UEFS)


## ✨ Observação
Este projeto demonstra aplicação prática de:

- Lógica digital
- Projeto de circuitos combinacionais
- Modularização em Verilog
- Implementação em FPGA

## 📄 Relatório completo
Para mais detalhes sobre o desenvolvimento do projeto, acesse o relatório completo
