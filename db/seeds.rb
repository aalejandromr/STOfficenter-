TipoDocumento.create!([
  {tipoDocumento: "DUI"},
  {tipoDocumento: "NRC"}
])

Oficina.create!([
  {name: "CENTRO SAN FRANCISCO", direccion: "Colonia San Francisco,  Calle Los Bambúes y Calle Los Abetos No. 37 A y B.  \nSan Salvador, El Salvador.  \n"},
  {name: "CENTRO SAN BENITO", direccion: "Colonia San Benito, Calle la Mascota #533, Edificio 533 primer nivel, \n San Salvador, El Salvador.\n"},
  {name: "CENTRO ESCALON", direccion: "Colonia Escalón,  Calle El Mirador, #4814, edificio  Vittoria quinto nivel, San Salvador, El Salvador. \n"},
  {name: "CENTRO LA GRAN VIA", direccion: nil}
])

PeriodoFacturacion.create!([
  {periodo: "6"},
  {periodo: "12"},
  {periodo: "18"},
  {periodo: "24"}
])

TipoContrato.create!([
  {tipoContrato: "FISICO"},
  {tipoContrato: "VIRTUAL"},
  {tipoContrato: "VIRTUAL BOX"}
])