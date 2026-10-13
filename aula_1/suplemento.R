library(DiagrammeR)
library(DiagrammeRsvg)
# library(rsvg)

grViz(
  "
digraph nivel_critico {

  graph [layout = neato, overlap = false]

  node [shape = box, style = filled, fillcolor = lightblue, fontname = Helvetica]

  # Nós periféricos
  caltura     [label = 'Ecologia']
  profundidade [label = 'Geociência']
  metodo      [label = 'Ciência de plantas']
  n_exp       [label = 'Engenharia agrícola']
  epoca       [label = 'Física, química']
  definicao   [label = 'Climatologia']
  meta        [label = 'Sensoriamento remoto']
  modelo      [label = 'Hidrologia']
  solo        [label = 'Mecanica do solo']

  # Nó central
  nivel       [label = 'Física do solo', shape = ellipse, fillcolor = orange]

  # Conexões para o centro
  caltura     -> nivel
  profundidade -> nivel
  metodo      -> nivel
  n_exp       -> nivel
  epoca       -> nivel
  definicao   -> nivel
  meta        -> nivel
  modelo      -> nivel
  solo        -> nivel
}
"
) -> dia

svg_xml <- export_svg(dia)
# diagrama
# Salvar como arquivo SVG
writeLines(svg_xml, "meu_diagrama2.svg")


library(DiagrammeR)

grViz(
  "
digraph soil_physics {

graph [
  layout = neato
  overlap = false
]

node [
  shape = box
  fontname = Helvetica
  fontsize = 12
]

# ------------------------
# Nós
# ------------------------

hidro [label='Hidrologia\\nMecânica do Solo',
       pos='0,2!']

clima [label='Climatologia',
       pos='2,2!']

fisica [label='Física\\nQuímica',
        pos='4,2!']

eco [label='Ecologia',
     pos='0,0!']

geo [label='Geociências',
     pos='0,-2!']

planta [label='Ciência de\\nPlantas',
        pos='2,-2!']

eng [label='Engenharia\\nAgrícola',
     pos='4,-2!']

rs [label='Sensoriamento Remoto\\nSIG, Lógica Fuzzy\\nRede Neural',
    pos='4,0!']

solo [label='FÍSICA\\nDO SOLO',
      shape=circle,
      width=1.3,
      height=1.3,
      fillcolor = orange,
      pos='2,0!']

# sust [label='Uso Sustentável\\ndo Solo e dos\\nRecursos Hídricos',
#       shape=ellipse,
#       pos='7,0!']

# ------------------------
# Ligações periféricas
# ------------------------

hidro -> clima [dir=both]
clima -> fisica [dir=both]

hidro -> eco [dir=both]
eco -> geo [dir=both]

geo -> planta [dir=both]
planta -> eng [dir=both]

fisica -> rs [dir=both]
rs -> eng [dir=both]

# ------------------------
# Ligações com Física do Solo
# ------------------------

hidro -> solo [dir=both]
clima -> solo [dir=both]
fisica -> solo [dir=both]

eco -> solo [dir=both]
planta -> solo [dir=both]

geo -> solo
eng -> solo

solo -> rs [dir=both]

# ------------------------
# Resultado final
# ------------------------

# rs -> sust

}
"
) -> dia

svg_xml <- export_svg(dia)
# diagrama
# Salvar como arquivo SVG
writeLines(svg_xml, "meu_diagrama2.svg")
