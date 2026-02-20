# LKNT64 — 8-Core 64-bit CPU (SkyWater 130nm MPW)

Este repositório contém o processador LKNT64, desenvolvido pela Lukintosh,
destinado à fabricação física através do Google/SkyWater Open MPW Shuttle.

## Especificações
- LKNT64 ISA (64 bits)
- 8 núcleos
- Pipeline básico
- Microcódigo opcional
- Objetivo: 25–40MHz em SKY130

## Diretórios
- verilog/ → RTL do processador
- openlane/ → configurações para síntese física
- caravel/ → wrapper obrigatório para MPW

## Licença
MIT License
